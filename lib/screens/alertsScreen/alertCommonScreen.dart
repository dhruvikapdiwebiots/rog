import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertsScreen_Style.dart';

class AlertCommonScreen {
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
        style: AlertsScreenStyle().commonTextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing),
      );

  //imageLayout
  final imageLayout = (
      context,
      image,
      ) =>
      Image.asset(
        image,
        width: MediaQuery.of(context).size.width,
        height: AppScreenUtil().size(420),
        fit: BoxFit.fill,
      );



  //main body ui design
  final body = (BuildContext context,list
    ) =>
  list;

}
