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
      child: Icon(
          isEnable ? CupertinoIcons.pencil_ellipsis_rectangle : Icons.edit));

  //commonLayout
  final commonLayout = (title, isEnable,
          {Widget? textformfieldWidget,
          String? value,
          GestureTapCallback? onTap}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingCommonScreen().commonText(
                  title,
                  fontSize: 16,
                ),
                SettingScreenStyle().specing(5),
                isEnable
                    ? textformfieldWidget!
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppScreenUtil().size(10),
                        ),
                        child: SettingCommonScreen()
                            .commonText(value, fontSize: 14, textDecoration:  TextDecoration.underline),
                      )
              ],
            ),
          ),
          SettingCommonScreen().iconInkWellCommon(isEnable, onTap: onTap)
        ],
      );

  //main body ui design
  final body = (BuildContext context, naemLayout, lastNameLayout, emailLayout,
          buttonLayout) =>
      SingleChildScrollView(
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
