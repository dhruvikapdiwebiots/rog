import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/settingScreen/SettingScreen_Style.dart';

class SettingCommonScreen {
  // common Text Layout
  final commonText = (text,
          {double? fontSize,
          TextAlign? textAlign,
          Color? color,
          FontWeight? fontWeight,
          double? letterSpacing,
          TextDecoration? textDecoration}) =>
      Text(
        text,
        textAlign: textAlign,
        style: SettingScreenStyle().commonTextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            textDecoration: textDecoration,
            letterSpacing: letterSpacing),
      );

  // SubmitButton
  final submitButton = ({GestureTapCallback? onTap}) => InkWell(
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
  final iconInkWellCommon = (isEnable, {GestureTapCallback? onTap}) => InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
              isEnable ? CupertinoIcons.pencil_ellipsis_rectangle : Icons.edit,color: appColor.buttonColor,size: AppScreenUtil().size(20),),
          SettingCommonScreen().commonText(AppFont().edit,fontSize: 12,color: appColor.buttonColor)
        ],
      ));

  //commonLayout
  final commonLayout = (title, isEnable,
          {Widget? textformfieldWidget,
          String? value,
          GestureTapCallback? onTap}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SettingCommonScreen().commonText(
            title,
            fontSize: 16,color: appColor.grey
          ),
          SettingScreenStyle().specingWidth(50),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isEnable
                    ? Expanded(child: textformfieldWidget!)
                    : Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppScreenUtil().size(10),
                  ),
                  child: SettingCommonScreen()
                      .commonText(value, fontSize: 14, textDecoration:  TextDecoration.underline, textAlign: TextAlign.start,),
                ),
                SettingCommonScreen().iconInkWellCommon(isEnable, onTap: onTap)
              ],
            ),
          )
        ],
      );

  //main body ui design
  final body = (BuildContext context, naemLayout, emailLayout,
          buttonLayout) =>
      SingleChildScrollView(
        child: Column(
          children: [
            naemLayout,
            SettingScreenStyle().specing(10),
            emailLayout,
            SettingScreenStyle().specing(50),
            buttonLayout
          ],
        ),
      );
}
