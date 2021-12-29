import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertCommonScreen.dart';
import 'package:rog/screens/alertsScreen/alertsScreen_Style.dart';
import 'package:rog/screens/cameraCard/CameraCardScreen_Style.dart';
import 'package:rog/screens/cameraCard/cameraCardCommonScreen.dart';

class AlertAndNoteLayout extends StatelessWidget {
  String? image;
  String? text;

  AlertAndNoteLayout({Key? key, this.image, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image!,
          height: AppScreenUtil().size(25),
        ),
        AlertsScreenStyle().specing(5),
        AlertCommonScreen().commonText(text,
            fontSize: 12, letterSpacing: .5, color: appColor.whiteColor)
      ],
    );
  }
}
