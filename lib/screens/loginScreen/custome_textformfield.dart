
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rog/theme/index.dart';

class CustomeTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? counterText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputType? textInputType;
  final int? maxLength;
  final int maxLines;
  final FocusNode? focusNode;
  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final FormFieldValidator<String>? validator;
  final TextAlign textAlign;
  final bool enabled;
  ValueChanged<String>? onFieldSubmitted;

  CustomeTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.counterText = "",
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.maxLength,
    this.maxLines = 1,
    this.focusNode,
    this.borderRadius = 30,
    this.horizontalPadding = 20,
    this.verticalPadding = 20,
    this.validator,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: appColor.secondaryColor,
          fontSize: 16,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: appColor.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: appColor.grey),
        ),
        errorStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        hintText: hintText,
        labelText: labelText,
        counterText: counterText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      style: appCss.text16White,
      keyboardType: textInputType,
      maxLength: maxLength,
      maxLines: maxLines,
      validator: validator,
      textAlign: textAlign,
      enabled: enabled,
      controller: controller,
    );
  }
}
