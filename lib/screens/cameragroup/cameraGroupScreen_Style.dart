import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';

class CameraGroupScreenStyle {

  // Speacing Width
  final specingWidth = (data) => SizedBox(
        width: AppScreenUtil().size(data),
      );

  //icon Style
final cameraIconStyle =  Image.asset(
  iconAssets.securitycamera,
  height: AppScreenUtil().size(25),
);
}
