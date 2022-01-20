import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/dashboard/bottomNavigatorBarCommon.dart';
import 'package:rog/screens/dashboard/dashboardScreen_Style.dart';
import 'package:rog/screens/dashboard/dashboard_Controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with WidgetsBindingObserver  {
  var dashboardCtrl = Get.put(DashboardController());
  Timer? timer;


  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addObserver(this);
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    super.initState();
  }

  //Check whether app is in which state
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print('state : $state');
  }


  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return GetBuilder<DashboardController>(
      builder: (_) => WillPopScope(
        onWillPop: () {
          Alertbox().appClose(context);
          return new Future(() => false);
        },
        child: Scaffold(
          bottomNavigationBar: BottomNavigatorCard(
            selectedIndex: dashboardCtrl.selectedIndex,
            onTap: (index) => dashboardCtrl.navigationbarchange(index),
          ),
          appBar: DashboardScreenStyle().appBarStyle(
              context, dashboardCtrl.selectedIndex,
              onBack: dashboardCtrl.onBack,
          ),
          body: dashboardCtrl.widgetOptions
              .elementAt(dashboardCtrl.selectedIndex),
        ),
      ),
    );
  }
}
