import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rog/packages/config_package.dart';

class CameraGroupScreenStyle {
  // Speacing Height

  final specing = (data) => SizedBox(
        height: AppScreenUtil().size(data),
      );

  // Speacing Width
  final specingWidth = (data) => SizedBox(
        width: AppScreenUtil().size(data),
      );

  //icon Style
final cameraIconStyle =  Container(
  alignment: Alignment.topRight,
  child: Image.asset(
    iconAssets.securitycamera,
    height: AppScreenUtil().size(18),
  ),
);
}
