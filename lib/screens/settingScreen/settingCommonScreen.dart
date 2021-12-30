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

  //Inkwell Common
  final iconInkWellCommon = (isEnable,{GestureTapCallback? onTap}) =>  InkWell(
      onTap: onTap,
      child: Icon(isEnable ?CupertinoIcons.pencil_ellipsis_rectangle :Icons.edit));

  //commonLayout
  final commonLayout = (isEnable,{Widget? textformfieldWidget,String? title,GestureTapCallback? onTap}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: AppScreenUtil().size(5)),
              child: SettingCommonScreen()
                  .commonText(AppFont().name, fontSize: 16),
            ),
            SettingScreenStyle().specing(5),
            isEnable ? textformfieldWidget! : Card(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppScreenUtil().size(10),
                    horizontal: AppScreenUtil().size(15)),
                child:  SettingCommonScreen().commonText(
                    title,
                    fontSize: 14),
              ),
            )
          ],
        ),
      ),
      SettingCommonScreen().iconInkWellCommon(
        isEnable,
          onTap: onTap
      )
    ],
  );

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
