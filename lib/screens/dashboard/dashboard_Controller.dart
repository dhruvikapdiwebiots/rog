import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertsScreen.dart';
import 'package:rog/screens/cameragroup/cameragroup.dart';
import 'package:rog/screens/connect/connect.dart';
import 'package:rog/screens/settingScreen/settingScreen.dart';
import 'package:rog/utils/commonController.dart';
import 'package:rog/utils/helper.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;
  String name = '';
  String lastname = '';
  String email = '';
  CommonController commonController = Get.find();

  //list of bottomnavigator page
  List<Widget> widgetOptions = <Widget>[
    CameraGroup(),
    Connect(),
    AlertsScreen(),
    SettingScreen()
  ];

  //on back from different page take it to last visit page
  onBack() async {
    int index = await Helper().getStorage('selectedIndex');
    selectedIndex = index;
    update();
  }

  //navigation bar change
  navigationbarchange(int index) async {
    await Helper().writeStorage('selectedIndex', selectedIndex);
    selectedIndex = index;
    print('index : ' + index.toString());
    update();
    if (selectedIndex == 3) {
      dynamic userData = await Helper().getStorage('userData');
      name = userData['first_name'];
      lastname = userData['last_name'];
      email = userData['email'];
      print('name : $name');
      update();
    }
  }
}
