import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/cameraCardCommonScreen.dart';

class SettingScreenStyle {
  // Speacing Height

  final specing = (data) => SizedBox(
        height: AppScreenUtil().size(data),
      );

  // Speacing Width
  final specingWidth = (data) => SizedBox(
        width: AppScreenUtil().size(data),
      );

  // Common Text
  final commonTextStyle = (
          {double? fontSize,
          FontWeight? fontWeight,
          Color? color,
          double? letterSpacing}) =>
      TextStyle(
          fontSize: AppScreenUtil().fontSize(fontSize!),
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: color);

  //login button COntainer
  final buttonContainerStyle = ({Widget? child}) => Container(
      decoration: BoxDecoration(
          color: appColor.buttonColor,
          border: Border.all(color: appColor.buttonColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.0)),
      child: child);

//animated Container
  final animatedContainer = ({Widget? child}) => AnimatedContainer(
      duration: Duration(seconds: 1),
      width: AppScreenUtil().screenActualWidth(),
      height: AppScreenUtil().screenHeight(50.0),
      alignment: Alignment.center,
      child: child);

  // Button Text Style
  final btnTextstyle = TextStyle(
      color: appColor.whiteColor,
      letterSpacing: 0.5,
      fontSize: AppScreenUtil().fontSize(20.0),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w500);
}
