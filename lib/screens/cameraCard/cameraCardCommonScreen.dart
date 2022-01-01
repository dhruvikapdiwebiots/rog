import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/CameraCardScreen_Style.dart';
import 'package:rog/screens/groupCameraList/groupCameraScreen_Style.dart';
import 'package:rog/screens/loginScreen/loginScreen_Style.dart';

class CameraCardCommonScreen {
  // common Text Layout
  final commonText = (text,
          {double? fontSize,
          TextAlign? textAlign,
          Color? color,
          FontWeight? fontWeight,
          double? letterSpacing}) =>
      Text(
        text,
        textAlign: textAlign,
        style: LoginScreenStyle().commonTextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing),
      );

  //imageLayout
  final imageLayout = (
    context,
    image,
  ) =>
      Image.asset(
        image,
        width: MediaQuery.of(context).size.width,
        height: AppScreenUtil().size(420),
        fit: BoxFit.fill,
      );

  //camera name Layout
  final cameraNameLayout = (text) => GroupCameraScreenStyle().cameraNameStyle(
      child: CameraCardCommonScreen().commonText(text, fontSize: 16));

  //main body ui design
  final body = (BuildContext context, cameraNameLayout, imageLayout,timeDateDisplay) => SingleChildScrollView(
    child: Column(
          children: [
            cameraNameLayout,
            CameraCardScreenStyle().colorSpace,
            imageLayout,
            CameraCardScreenStyle().specing(10),
            timeDateDisplay
          ],
        ),
  );
}
