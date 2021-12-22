import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';

class SplashCommonScreen {
  //imageLayout
  final imageLayout = Image.asset(
    imageAssets.logo,
    height: appScreenUtil.size(150),
    width: appScreenUtil.size(180),
    fit: BoxFit.contain,
    color: appColor.whiteColor,
  );

  // Speacing
  final specing = (data) => SizedBox(
    height: AppScreenUtil().size(data),
  );

  //alertText
final alertText = Text(
  AppFont().alertLoading,
  style: TextStyle(color: appColor.whiteColor),
);

}
