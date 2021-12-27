import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertsScreen.dart';
import 'package:rog/screens/cameragroup/cameragroup.dart';
import 'package:rog/screens/settingScreen/settingScreen.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;

  //list of bottomnavigator page
  List<Widget> widgetOptions = <Widget>[
    CameraGroup(),
    AlertsScreen(),
    SettingScreen()
  ];


  //navigation bar change
  navigationbarchange(int index) async {
    selectedIndex = index;
    print('index : ' + index.toString());
    update();
  }
}
