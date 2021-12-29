import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/utils/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController extends GetxController {
  bool passwordVisible = true;
  bool changeButton = false;
  bool isLoading = false;
  var user = TextEditingController();
  var password = TextEditingController();
  final FocusNode userFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  dynamic title = '';
  bool isShowError = false;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  bool isEmailShowError = false;
  bool isVisible = false;

  // Toggle Between Password show
  void toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  //login api
  checkLogin() async {
    isLoading = true;
    update();
    if (user.text != "" && password.text != "") {
      isShowError = false;
      update();
      try {
        var requestData = {
          "email": user.text,
          "password": password.text,
        };

        print(requestData.toString());
        await apis
            .apiCall(apiMethods.login, requestData, 'post')
            .then((resData) async {
          isLoading = false;
          update();
          if (resData != 'No Internet') {
            print('status :${resData.statusCode}');
            if (resData.statusCode == 200) {
              print(resData.body['jwt']);
              if (resData.body['jwt'] != null && resData.body['jwt'] != "") {
                dynamic data = resData.body['jwt'];
                print('jwt : $data');
                SharedPref().save('token', data);
                update();
                Alertbox().successMessage('Login Successfully');
                getUserData();
              } else {
                isShowError = true;
                print(resData.data);
                Alertbox().alertMessage('Might be some issue while Login');
              }
            } else {
              isShowError = true;
              update();
              print(resData.data);
              Alertbox().alertMessage('Might be some issue while Login');
            }
          } else {
            Alertbox().alertMessage('No Internet');
          }
        });

        isLoading = false;
      } catch (e) {
        isLoading = false;
        isShowError = true;
        update();
        print(e);
      }
    } else {
      isLoading = false;
      isShowError = true;
      update();
    }
  }

  getUserData() async {
    try {
      List requestData = [];

      print(requestData.toString());
      var resData = await apis.apiCall(apiMethods.users, requestData, 'get');
      print('status :${resData.statusCode}');
      if (resData.statusCode == 200) {
        isLoading = false;
        var data = resData.body;
        await Helper().writeStorage('userData', data);
        update();
        await setFirebase();
        Get.toNamed(routeName.dashboard);
      } else {
        print('Error while getting userData');
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      isShowError = true;
      update();
      print(e);
    }
  }

  setFirebase() async {
    var token = await FirebaseMessaging.instance.getToken();
    dynamic userData = await Helper().getStorage('userData');
    print('userData : $userData');

    /*users
        .doc(userData['userId'])
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        users
            .doc(userData['userId'])
            .update({'fcmToken': token})
            .then((value) => print("User Updated"))
            .catchError((error) => print("Failed to update user: $error"));
      } else {
        users
            .add({'userId': userData['userId'], 'fcmToken': token})
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
    });*/
  }

  //forgot password api
  forgotPassword(context) async {
    print('Calling');
    isLoading = true;
    isEmailShowError = false;
    update();
    try {
      var requestData = {"email": user.text};

      print(requestData.toString());
      var resData =
          await apis.apiCall(apiMethods.forgotpassword, requestData, 'post');
      print('status :${resData.statusCode}');
      if (resData.statusCode == 200) {
        isLoading = false;
        isVisible = false;
        update();
        _ourAutoDismissDialog(context);
      } else {
        isEmailShowError = true;
        isLoading = false;
        update();
        print('error : ${resData.data}');
      }
      isLoading = false;
    } catch (e) {
      print('error');
      isEmailShowError = true;
      isLoading = false;
      update();
      print(e);
    }
  }

  //auto dissmiss pop out
  void _ourAutoDismissDialog(BuildContext context) {
    //Calling out showdialog method
    Alertbox().showAlertDialogToSendLink(context,
        title: AppFont().checkMail, message: AppFont().checkMailMessage);

    //Auto dismissing after the 5 seconds
    // You can set the time as per your requirements in Duration
    // This will dismiss the dialog automatically after the time you have mentioned
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }

  //on back hide forget password layout
  isBack() {
    isVisible = false;
    update();
  }
}
