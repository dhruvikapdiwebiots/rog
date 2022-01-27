import 'dart:async';

import 'package:cron/cron.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/dashboard/dashboard.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rog/utils/commonController.dart';
import 'package:rog/utils/helper.dart';

//when app in background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  AndroidNotification? android = message.notification?.android;
}

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel? channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

class DashboardIndex extends StatefulWidget {
  const DashboardIndex({Key? key}) : super(key: key);

  @override
  _DashboardIndexState createState() => _DashboardIndexState();
}

class _DashboardIndexState extends State<DashboardIndex>
    with WidgetsBindingObserver {
  CommonController commonController = Get.find();
  Timer? timer;
  var cron = new Cron();

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    initNotification();
    print('init');
    cron.schedule(Schedule.parse('*/3 * * * *'), () {
      print('Date : ${DateTime.now()}');
      commonController.getNewAlertCount();
    });

    super.initState();
  }

  //Check whether app is in which state
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print('Indexstate : $state');
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);

    cron.close();
    super.dispose();
  }

  @override
  void onDeactivate() {
    super.deactivate();
  }

  Future<void> initNotification() async {
    print('initCall');
    //when app in background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // titledescription
        importance: Importance.high,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin!
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel!);
    }

    //when app is [closed | killed | terminated]
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print("Notification On InitMsg");
        print(message);
        //Navigator.pushNamed(context, '/result', arguments: message.data);
        _notificationNavigateToItemDetail(message);
      }
    });

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
        android: initialzationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin!.initialize(initializationSettings);
    print('initCheck');
    //when app in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('message : $message');
      RemoteNotification notification = message.notification!;

      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
      _notificationNavigateToItemDetail(message);
      //Navigator.pushNamed(context, '/result', arguments: message.data);
    });

    //when app in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print(message);

      _notificationNavigateToItemDetail(message);
    });

    requestPermissions();
  }

  //on click navigate to alert screeb
  void _notificationNavigateToItemDetail(RemoteMessage message) async {
    print("Call Notification");

    dynamic additionalData = message.data;
    print('notificationData : $additionalData');
    if (additionalData["alertMessage"] == "true") {
      await Helper().writeStorage('selectedIndex', 1);
      await Helper().writeStorage('alertMessage', 'true');
      Get.toNamed(routeName.dashboard);
    }
  }

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("token : $token");
  }

  requestPermissions() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    print(settings.authorizationStatus);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Dashboard();
  }
}
