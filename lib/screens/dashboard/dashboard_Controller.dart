import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertsScreen.dart';
import 'package:rog/screens/cameragroup/cameragroup.dart';
import 'package:rog/screens/settingScreen/settingScreen.dart';
import 'package:rog/utils/helper.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;
  String name = '';
  String lastname = '';
  String email = '';


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
    if(selectedIndex == 2){
      dynamic userData = await Helper().getStorage('userData');
      name = userData['first_name'];
      lastname = userData['last_name'];
      email  = userData['email'];
      print('name : $name');
      update();
    }
  }
}
