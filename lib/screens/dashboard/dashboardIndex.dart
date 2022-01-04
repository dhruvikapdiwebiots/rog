import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rog/screens/dashboard/dashboard.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

class _DashboardIndexState extends State<DashboardIndex> {

  @override
  void initState() {
    initNotification();
    print('init');
    super.initState();
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
      await flutterLocalNotificationsPlugin!.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel!);
    }

    //when app is [closed | killed | terminated]
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        print("Notification On InitMsg");
        print(message);
        //Navigator.pushNamed(context, '/result', arguments: message.data);

      }
    });

    var initialzationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(android: initialzationSettingsAndroid);

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

      //Navigator.pushNamed(context, '/result', arguments: message.data);
    });

    //when app in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print(message);
      //Navigator.push(context, MaterialPageRoute(builder: (_) => ResultScreen(data: message.data)));
      //Navigator.pushNamed(context, '/result', arguments: message.data);
    });

    requestPermissions();

    getToken();
  }

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("token : $token");
  }

  requestPermissions() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    print(settings.authorizationStatus);
  }


  @override
  Widget build(BuildContext context) {
    return Dashboard();
  }
}
