import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rog/theme/app_font.dart';
import 'package:rog/theme/index.dart';
import 'package:rog/utils/app_screen_util.dart';

class Alertbox {
  //show alert dialog
  showAlertDialog(BuildContext context,String title, String message,{GestureTapCallback? onTap}) {
    Widget okButton = InkWell(
        onTap: () => onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().size(3),
              horizontal: AppScreenUtil().size(18)),
          decoration: BoxDecoration(
              color: appColor.primaryColor,
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(20))),
          child: Text(AppFont().ok,
              style: TextStyle(
                  color: appColor.whiteColor,
                  fontSize: AppScreenUtil().fontSize(16))),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, AppScreenUtil().size(5)),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Color(0xFFFF0000)),
          ),
        ),
        child: Text(title,
            style: TextStyle(fontSize: AppScreenUtil().fontSize(20.0))),
      ),
      content: Text(
        message,
        style: TextStyle(
            color: Colors.black87, fontSize: AppScreenUtil().fontSize(16.0)),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
              right: AppScreenUtil().size(15),
              bottom: AppScreenUtil().size(10)),
          child: okButton,
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

/*

  //logout alert
  alertBack(BuildContext context) {
    showDialog(
      builder: (context) => AlertDialog(
        content: Text(AppFont().askForLogout),
        actions: [
          Container(
            margin: EdgeInsets.only(bottom: AppScreenUtil().size(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                HomeCommonScreen().customButton(
                    onTap: () async {
                      SharedPref().remove("isLogin");
                      SharedPref().remove("userName");
                      Get.offAllNamed(routeName.login);
                    },
                    text: AppFont().yes),
                HomeScreenStyle().specingWidth(10),
                HomeCommonScreen().customButton(
                    onTap: () async {
                      Get.back();
                    },
                    text: AppFont().no),
                HomeScreenStyle().specingWidth(10),
              ],
            ),
          )
        ],
      ),
      context: Get.context!,
    );
  }
*/

  //exit from the app pop
  appClose(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text(AppFont().areYouSure),
              content: Text(AppFont().confirmationForexitApp),
              actions: [
                new FlatButton(
                  child: Text(
                    AppFont().yes,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                new FlatButton(
                  child: Text(
                    AppFont().no,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          );
        });
  }

  successMessage(message) => Get.snackbar('Success', message,
      backgroundColor: Colors.green, colorText: Colors.white);

  errorMessage(message) => Get.snackbar('Error', message,
      backgroundColor: Colors.red, colorText: Colors.white);

  alertMessage(message) => Get.snackbar('Alert', message,
      backgroundColor: Colors.yellow, colorText: Colors.black);

  //success flutter toast
  showAlertDialogToSendLink(BuildContext context,{String? title,String? message}) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, AppScreenUtil().size(5)),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Color(0xFFFF0000)),
          ),
        ),
        child: Text(title!,
            style: TextStyle(fontSize: AppScreenUtil().fontSize(20.0))),
      ),
      content: Text(
        message!,
        style: TextStyle(
            color: Colors.black87, fontSize: AppScreenUtil().fontSize(16.0)),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
