import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertsScreen.dart';
import 'package:rog/screens/cameragroup/cameragroup.dart';
import 'package:rog/screens/settingScreen/settingScreen.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    CameraGroup(),
    AlertsScreen(),
    SettingScreen()
  ];

  Future<bool>? onWillPop(context) {
    if (selectedIndex > 0) {
      selectedIndex = 0;
      update();
    } else {
      Alertbox().appClose(context);
    }
  }

  //navigation bar change
  navigationbarchange(int index) async {
    selectedIndex = index;
    print('index : ' + index.toString());
    update();
  }
}
