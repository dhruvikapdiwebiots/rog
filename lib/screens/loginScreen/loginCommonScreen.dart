import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/loginScreen/loginScreen_Style.dart';

class LoginCommonScreen {
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
  final imageLayout = Image.asset(
    imageAssets.logo,
    width: AppScreenUtil().screenActualWidth(),
    height: AppScreenUtil().screenHeight(100),
    color: appColor.primaryColor,
  );

  // TextInputField
  final decorationField = (data, {Widget? suffixIcon}) => InputDecoration(
      contentPadding: LoginScreenStyle().edgeInsets,
      hintStyle: TextStyle(color: appColor.grey),
      hintText: data,
      suffixIcon: suffixIcon);

  //Licence&PrivacyText
  final licenceAndPrivacyText = (text) => LoginCommonScreen().commonText(text,
      color: appColor.buttonColor, fontSize: 16, fontWeight: FontWeight.w500);

  //main body ui design
  final body = (
    BuildContext context,
    _formKey,
    userLayout,
    passwordLayout,
    forgotuserIdandPasswordLayout,
    buttonLayout,
      licenceAndPrivacyLayout,
      signupLayout,
      isShowError
  ) =>
      Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginScreenStyle().specing(30.0),
              LoginCommonScreen().imageLayout,
              LoginScreenStyle().specing(10.0),
              isShowError,
              LoginScreenStyle().specing(30.0),
              userLayout,
              LoginScreenStyle().specing(30.0),
              passwordLayout,
              LoginScreenStyle().specing(30.0),
              forgotuserIdandPasswordLayout,
              LoginScreenStyle().specing(50.0),
              buttonLayout,
              LoginScreenStyle().specing(10.0),
              licenceAndPrivacyLayout,
              LoginScreenStyle().specing(25.0),
              signupLayout
            ],
          ));

  // SubmitButton
  final submitButton = ({GestureTapCallback? onTap}) => InkWell(
      onTap: onTap,
      child: LoginScreenStyle().buttonContainerStyle(
        child: LoginScreenStyle().animatedContainer(
          child: Text(
            AppFont().signIn,
            style: LoginScreenStyle().btnTextstyle,
          ),
        ),
      ));
}
