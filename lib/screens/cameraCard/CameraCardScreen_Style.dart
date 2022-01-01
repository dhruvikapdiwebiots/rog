import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/cameraCardCommonScreen.dart';

class CameraCardScreenStyle {
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

  //camera and group name style
  final cameraAndGroupNameStyle = ({Widget? child}) => Container(
        padding: EdgeInsets.all(AppScreenUtil().size(8)),
        alignment: Alignment.center,
        color: appColor.whiteColor,
        child: child,
      );

  //view live and alert style
  final viewLiveAndAlertStyle = ({Widget? child}) => Container(
        padding: EdgeInsets.only(
            top: AppScreenUtil().size(12),
            left: AppScreenUtil().size(10),
            right: AppScreenUtil().size(10),
            bottom: AppScreenUtil().size(10)),
        color: appColor.darkGray,
        child: child,
      );

  //commn ColumnStyle
  final commonColumnLayout = (image, text) => Column(
        children: [
          Image.asset(image),
          CameraCardScreenStyle().specing(5),
          CameraCardCommonScreen()
              .commonText(text, fontSize: 12, color: appColor.whiteColor)
        ],
      );

  //color space
  final colorSpace = Container(
    height: AppScreenUtil().size(10),
    color: appColor.darkGray,
  );
}
