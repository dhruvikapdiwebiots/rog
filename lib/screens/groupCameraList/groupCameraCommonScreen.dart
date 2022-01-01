import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/groupCameraList/groupCameraScreen_Style.dart';

class GroupCameraCommonScreen {
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
        style: GroupCameraScreenStyle().commonTextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing),
      );


  //imageLayout
  final imageLayout = (image,height,width) => ClipRRect(
    borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(50)),
    child: Image.asset(
      image,
      width: AppScreenUtil().size(width),
      height: AppScreenUtil().size(height),
      fit: BoxFit.cover,
    ),
  );

  //camera name Layout
  final cameraNameLayout = (text) => GroupCameraScreenStyle().cameraNameStyle(
    child: GroupCameraCommonScreen().commonText(text,fontSize: 16)
  );

  //main body ui design
  final body = (BuildContext context,
      cameraNameLayout,list
    ) =>
      Column(
        children: [
          cameraNameLayout,
          GroupCameraScreenStyle().specing(10),
list
        ],
      );

}
