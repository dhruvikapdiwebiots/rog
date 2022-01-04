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

//text STyle
  final titleStyle = Text(
    AppFont().cameraView,
    style: new TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: AppScreenUtil().fontSize(18.0),
        fontWeight: FontWeight.w500,
        color: appColor.whiteColor),
  );

  // app bar decoration
  final appBarDecorationStyle = BoxDecoration(
      gradient: new LinearGradient(colors: [
        appColor.primaryColor,
        appColor.primarlightColor1,
        appColor.primarlightColor
      ]),
      boxShadow: [
        new BoxShadow(
          color: Colors.grey[500]!,
          blurRadius: 20.0,
          spreadRadius: 1.0,
        )
      ]);

//appbar style
  final appBarStyle = (context, {GestureTapCallback? onBack}) => PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new Padding(
            padding: EdgeInsets.only(
                left: AppScreenUtil().size(25.0),
                top: AppScreenUtil().size(20.0),
                bottom: AppScreenUtil().size(20.0)),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: onBack,
                      child: CameraCardCommonScreen()
                          .menuiconStyl(Icons.arrow_back),
                    ),
                    CameraCardScreenStyle().specingWidth(15),
                    CameraCardScreenStyle().titleStyle,
                  ],
                ),
              ],
            ),
          ),
          decoration: CameraCardScreenStyle().appBarDecorationStyle,
        ),
        preferredSize: new Size(
            MediaQuery.of(context).size.width, AppScreenUtil().size(150.0)),
      );
}
