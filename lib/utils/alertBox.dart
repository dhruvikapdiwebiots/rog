import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/dashboard/dashboardScreen_Style.dart';

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
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: appColor.redBorderColor),
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


  //logout alert
  alertLogout(BuildContext context) {
    showDialog(
      builder: (context) => AlertDialog(
        content: Text(AppFont().askForLogout),

        actions: [
          Container(
            margin: EdgeInsets.only(bottom: AppScreenUtil().size(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DashboardScreenStyle().customButton(
                    onTap: () async {
                      SharedPref().remove("token");
                      Get.offAllNamed(routeName.loginScreen);
                    },
                    text: AppFont().yes),
                DashboardScreenStyle().specingWidth(10),
                DashboardScreenStyle().customButton(
                    onTap: () async {
                      Get.back();
                    },
                    text: AppFont().no),
                DashboardScreenStyle().specingWidth(10),
              ],
            ),
          )
        ],
      ),
      context: Get.context!,
    );
  }

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
              actionsPadding: EdgeInsets.only(bottom: AppScreenUtil().size(10)),
              actions: [
                DashboardScreenStyle().customButton(
                    onTap: () async {
                      SystemNavigator.pop();
                    },
                    text: AppFont().yes),
                DashboardScreenStyle().specingWidth(10),
                DashboardScreenStyle().customButton(
                    onTap: () async {
                      Get.back();
                    },
                    text: AppFont().no),
                DashboardScreenStyle().specingWidth(10),
              ],
            ),
          );
        });
  }

  successMessage(message) => Get.snackbar('Success', message,
      backgroundColor: appColor.greenColor, colorText: appColor.whiteColor);

  errorMessage(message) => Get.snackbar('Error', message,
      backgroundColor: appColor.redColor, colorText: appColor.whiteColor);

  alertMessage(message) => Get.snackbar('Alert', message,
      backgroundColor: appColor.yellowColor, colorText: appColor.blackColor);

  //success flutter toast
  showAlertDialogToSendLink(BuildContext context,{String? title,String? message}) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(AppFont().ok),
      onPressed: () {

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, AppScreenUtil().size(5)),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: appColor.redBorderColor),
          ),
        ),
        child: Text(title!,
            style: TextStyle(fontSize: AppScreenUtil().fontSize(20.0))),
      ),
      content: Text(
        message!,
        style: TextStyle(
            color: appColor.black87Color, fontSize: AppScreenUtil().fontSize(16.0)),
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
