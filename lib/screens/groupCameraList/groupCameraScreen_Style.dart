import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/groupCameraList/groupCameraCommonScreen.dart';

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

//text STyle
  final titleStyle = Text(
    AppFont().cameragroups,
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
  final appBarStyle = (context,
      {
        GestureTapCallback? onBack}) =>
      PreferredSize(
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
                      child: GroupCameraCommonScreen()
                          .menuiconStyl(Icons.arrow_back),
                    ),
                    GroupCameraScreenStyle().specingWidth(15),
                    GroupCameraScreenStyle().titleStyle,
                  ],
                ),
              ],
            ),
          ),
          decoration: GroupCameraScreenStyle().appBarDecorationStyle,
        ),
        preferredSize: new Size(
            MediaQuery.of(context).size.width, AppScreenUtil().size(150.0)),
      );
}
