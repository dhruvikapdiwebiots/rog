import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/CameraCardScreen_Style.dart';
import 'package:rog/screens/groupCameraList/groupCameraScreen_Style.dart';
import 'package:rog/screens/loginScreen/loginScreen_Style.dart';
import 'package:rog/screens/settingScreen/SettingScreen_Style.dart';

class SettingCommonScreen {
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
        style: SettingScreenStyle().commonTextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,

            letterSpacing: letterSpacing),
      );

  // SubmitButton
  final submitButton =
      ({GestureTapCallback? onTap}) => InkWell(
      onTap: onTap,
      child: SettingScreenStyle().buttonContainerStyle(
        child: SettingScreenStyle().animatedContainer(
          child: Text(
            AppFont().done,
            style: SettingScreenStyle().btnTextstyle,
          ),
        ),
      ));

  //main body ui design
  final body = (BuildContext context,naemLayout,lastNameLayout,emailLayout,buttonLayout ) => SingleChildScrollView(
    child: Column(
          children: [
            naemLayout,
            SettingScreenStyle().specing(10),
            lastNameLayout,
            SettingScreenStyle().specing(10),
            emailLayout,
            SettingScreenStyle().specing(50),
            buttonLayout

          ],
        ),
  );
}
