import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(Duration(seconds: 2), () {
      checkLogin();
    });
    super.onInit();
  }

//check wether user already login or not
  void checkLogin() async {
    Get.toNamed(routeName.login);
  }
}
