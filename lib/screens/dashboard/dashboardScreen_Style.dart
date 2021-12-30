import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rog/packages/config_package.dart';

class DashboardScreenStyle {

  // Speacing Width
  final specingWidth = (data) => SizedBox(
        width: AppScreenUtil().size(data),
      );

  //text STyle
  final titleStyle = (selectedIndex) => Text(
        selectedIndex == 0
            ? AppFont().mycameragroups
            : selectedIndex == 1
                ? AppFont().alerts
                : AppFont().setting,
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

//menu Icon Style
  final menuiconStyl = Icon(
    Icons.menu,
    color: appColor.whiteColor,
  );

  //container box decoration for completedexercise and training
  final boxDecoration = (
          {List<BoxShadow>? boxShadow,
          double? borderRadius,
          Color? color,
          Color? borderColor}) =>
      BoxDecoration(
          boxShadow: boxShadow,
          color: color,
          border: Border.all(color: borderColor!, width: 1.5),
          borderRadius: BorderRadius.circular(
              AppScreenUtil().borderRadius(borderRadius!)));

  //custom button
  final customButton = ({GestureTapCallback? onTap, String? text}) => InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(
                vertical: AppScreenUtil().size(3),
                horizontal: AppScreenUtil().size(18)),
            decoration: DashboardScreenStyle().boxDecoration(
                color: appColor.primaryColor,
                borderRadius: 20,
                borderColor: appColor.primaryColor),
            child: Text(
              text!,
              style: TextStyle(
                  color: appColor.whiteColor,
                  fontSize: AppScreenUtil().fontSize(14)),
            )),
      );

  //appbar style
  final appBarStyle = (context, selectedIndex,{GestureTapCallback? onTapPushNotification}) => PreferredSize(
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
                      onTap: () {
                        Alertbox().alertLogout(context);
                      },
                      child: DashboardScreenStyle().menuiconStyl,
                    ),
                    DashboardScreenStyle().specingWidth(15),
                    DashboardScreenStyle().titleStyle(selectedIndex),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: AppScreenUtil().size(15)),
                  child: InkWell(
                      onTap: onTapPushNotification,
                      child: Icon(Icons.notifications_active, color: appColor.whiteColor,)),
                ),
                
              ],
            ),
          ),
          decoration: DashboardScreenStyle().appBarDecorationStyle,
        ),
        preferredSize: new Size(
            MediaQuery.of(context).size.width, AppScreenUtil().size(150.0)),
      );
}
