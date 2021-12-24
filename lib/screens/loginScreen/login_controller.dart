import 'package:flutter/material.dart';
import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';

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
  bool isVisible = false;

  // Toggle Between Password show
  void toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

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
        var resData = await apis.postApi(apiMethods.login, requestData);
        print('status :${resData.statusCode}');
        if (resData.statusCode == 200) {
          isLoading = false;
          print(resData.body['jwt']);
          if (resData.body['jwt'] != null && resData.body['jwt'] != "") {
            dynamic data = resData.body['jwt'];
            print('jwt : $data');
            SharedPref().save('token', 'data');
            update();
            Alertbox().successMessage('Login Successfully');
            Get.toNamed(routeName.dashboard);
          } else {
            isShowError = true;
            print(resData.data);

            Alertbox().alertMessage('Might be some issue while Login');
          }
        } else {
          isLoading = false;
          isShowError = true;
          update();
          print(resData.data);
          Alertbox().alertMessage('Might be some issue while Login');
        }
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

  forgotPassword(context) async {
    print('Calling');
    isLoading = true;
    update();
    try {
      var requestData = {"email": user.text};

      print(requestData.toString());
      var resData = await apis.postApi(apiMethods.forgotpassword, requestData);
      print('status :${resData.statusCode}');
      if (resData.statusCode == 200) {
        isLoading = false;
        isVisible = false;
        update();
        _ourAutoDismissDialog(context);
      } else {
        isLoading = false;
        update();
        print(resData.data);
        Alertbox().alertMessage('Might be some issue while Login');
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }

  signup(context) async {
    print('Calling');
    isLoading = true;
    update();
    try {
      var requestData = {"email": user.text};

      print(requestData.toString());
      var resData = await apis.postApi(apiMethods.forgotpassword, requestData);
      print('status :${resData.statusCode}');
      if (resData.statusCode == 200) {
        isLoading = false;
        isVisible = false;
        update();
        _ourAutoDismissDialog(context);
      } else {
        isLoading = false;
        update();
        print(resData.data);
        Alertbox().alertMessage('Might be some issue while Login');
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }

  void _ourAutoDismissDialog(BuildContext context){

    //Calling out showdialog method
    Alertbox().showAlertDialogToSendLink(context,title:AppFont().checkMail,message:AppFont().checkMailMessage);

    //Auto dismissing after the 5 seconds
    // You can set the time as per your requirements in Duration
    // This will dismiss the dialog automatically after the time you have mentioned
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pop();
    });
  }


  onConfirm(context) {
    isVisible = false;
    update();
  }

  isBack() {
    isVisible = false;
    update();
  }
}
