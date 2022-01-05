import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/CameraCardScreen_Style.dart';
import 'package:rog/screens/cameraCard/cameraCardCommonScreen.dart';

class ViewAndAlertLayout extends StatelessWidget {
  String? image;
  String? text;

  ViewAndAlertLayout({Key? key, this.image, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image!,
          height: AppScreenUtil().size(25),
        ),
        CameraCardScreenStyle().specing(5),
        CameraCardCommonScreen().commonText(text,
            fontSize: 10, letterSpacing: .3, color: appColor.whiteColor)
      ],
    );
  }
}
