import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/loginScreen/loginScreen_Style.dart';

class CameraGroupCommonScreen {
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
        style: LoginScreenStyle().commonTextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing),
      );

  //imageLayout
  final imageLayout = (image,height,width) => Image.asset(
    image,
    width: AppScreenUtil().size(width),
    height: AppScreenUtil().size(height),
    fit: BoxFit.cover,
  );

  //main body ui design
  final body = (BuildContext context, listOfCameraGroup) => listOfCameraGroup;
}
