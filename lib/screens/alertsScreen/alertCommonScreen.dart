import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertsScreen_Style.dart';
import 'package:rog/utils/custom_cached_network_image.dart';

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
      CustomCachedNetworkImage(
        url: image,
        width: MediaQuery.of(context).size.width,
        height: AppScreenUtil().size(400),
        fit: BoxFit.fill,
        errorLocalPath: imageAssets.cameraNote,
      );

  //main body ui design
  final body = (BuildContext context, list) => list;
}
