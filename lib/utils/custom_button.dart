import 'package:flutter/material.dart';
import 'package:rog/utils/app_screen_util.dart';

class CustomButton extends StatelessWidget {
  dynamic? boxDecoration;
  Widget? buttonLayout;
  AlignmentGeometry? textAlign;
  double? width;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  GestureTapCallback? onTap;

  CustomButton(
      {Key? key,
      this.boxDecoration,
      this.buttonLayout,
      this.textAlign,
      this.width,
      this.padding,
      this.margin,this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: textAlign,
        width: AppScreenUtil().size(width!),
        padding: padding,
        margin: margin,
        decoration: boxDecoration,
        child: buttonLayout,
      ),
    );
  }
}
