import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rog/packages/config_package.dart';

class GroupCameraScreenStyle {
  // Speacing Height

  final specing = (data) => SizedBox(
        height: AppScreenUtil().size(data),
      );

  // Speacing Width
  final specingWidth = (data) => SizedBox(
        width: AppScreenUtil().size(data),
      );

  //icon Style
  final cameraIconStyle = Container(
    alignment: Alignment.topRight,
    child: Image.asset(
      iconAssets.securitycamera,
      height: AppScreenUtil().size(20),
    ),
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

  //camera name style
final cameraNameStyle = ({Widget? child}) => Container(
  color: appColor.whiteColor,
  padding: EdgeInsets.all(AppScreenUtil().size(12)),
  alignment: Alignment.center,
  child: child,
);
}
