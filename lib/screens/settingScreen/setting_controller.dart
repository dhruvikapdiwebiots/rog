import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/dashboard/dashboard_Controller.dart';
import 'package:rog/utils/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingController extends GetxController {
  String name = '';
  String email = '';
  bool isLoading = false;
  DashboardController dashboardCtrl = Get.find();
  TextEditingController controller = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool isEnable = false;
  bool isLastNameEnable = false;

  @override
  void onInit() {
    // TODO: implement onIniteusr
    getData();
    super.onInit();
  }

  getData() async {
    dynamic userData = await Helper().getStorage('userData');
    controller.text = userData['first_name'];
    lastNameController.text = userData['email'];
    print('name : $name');
    update();
  }

  isNameEdit(){
    isEnable = !isEnable;
    update();
  }

  isLastNameEdit(){
    isLastNameEnable = !isLastNameEnable;
    update();
  }

  updateData() async {
    print('Calling');
    isLoading = true;
    update();
    try {
      dynamic userData = await Helper().getStorage('userData');

      var requestData = {
        "email": userData['email'],
        'first_name': controller.text,
        'last_name': lastNameController.text,
      };

      print(requestData.toString());
      var resData =
          await apis.apiCall(apiMethods.users + '/${userData['uuid']}', requestData, 'patch');
      print('status :${resData.statusCode}');
      print('status :${resData.body['user']}');
      if (resData.statusCode == 200) {
        isLoading = false;
        await Helper().writeStorage('userData', resData.body['user']);

        dashboardCtrl.name = resData.body['user']['first_name'];
        controller.text = resData.body['user']['first_name'];
        dashboardCtrl.lastname = resData.body['user']['last_name'];
        lastNameController.text = resData.body['user']['last_name'];

        update();
        Alertbox().successMessage(resData.body['Success']);
      } else {
        isLoading = false;
        update();
        print('error : ${resData.data}');
      }
      isLoading = false;
    } catch (e) {
      print('error');
      isLoading = false;
      update();
      print(e);
    }
  }
}
