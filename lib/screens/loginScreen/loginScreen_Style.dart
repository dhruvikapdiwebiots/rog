import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rog/packages/config_package.dart';

class LoginScreenStyle {
  // Speacing Height

  final specing = (data) => SizedBox(
    height: AppScreenUtil().size(data),
  );

  // Speacing Width
  final specingWidth = (data) => SizedBox(
    width: AppScreenUtil().size(data),
  );

  //container box decoration for completedexercise and training
  final boxDecoration = (
      {List<BoxShadow>? boxShadow,
        double borderRadius = 0,
        Color? color,
        Color? borderColor}) =>
      BoxDecoration(
          boxShadow: boxShadow,
          color: color,
          border: Border.all(color: borderColor!, width: 1.5),
          borderRadius: BorderRadius.circular(
              AppScreenUtil().borderRadius(borderRadius)));

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

  // Button Text Style
  final btnTextstyle = TextStyle(
      color: appColor.whiteColor,
      letterSpacing: 0.5,
      fontSize: AppScreenUtil().fontSize(20.0),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w500);

//spacing from edges
  final edgeInsets = EdgeInsets.symmetric(
      vertical: AppScreenUtil().screenHeight(12.0),
      horizontal: AppScreenUtil().screenWidth(10.0));

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

//image layout container
  final imageLayoutContainer = ({Widget? child}) => Container(
    alignment: Alignment.bottomRight,
    width: AppScreenUtil().screenActualWidth(),
    height: AppScreenUtil().screenHeight(250.0),
    decoration: BoxDecoration(
        color: appColor.primaryColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [child!],
    ),
  );

//forgot userid and password Style
  final forgotUseridandpasswordStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: AppScreenUtil().fontSize(14));
}