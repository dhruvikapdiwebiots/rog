import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/loginScreen/forgotPasswordLayout.dart';
import 'package:rog/screens/loginScreen/loginCommonScreen.dart';
import 'package:rog/screens/loginScreen/login_controller.dart';
import 'package:rog/screens/loginScreen/login_validation.dart';
import 'package:rog/screens/loginScreen/privacyAndLicence.dart';
import 'package:rog/utils/helper.dart';
import 'package:rog/utils/loading_component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginCtrl = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //focus change
    _fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

    // User Field Layout
    final userLayout = TextFormField(
        controller: loginCtrl.user,
        focusNode: loginCtrl.userFocus,
        onFieldSubmitted: (value) {
          _fieldFocusChange(
              context, loginCtrl.userFocus, loginCtrl.passwordFocus);
        },
        decoration: LoginCommonScreen().decorationField(AppFont().hintuserName),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => LoginValidation().checkIDValidation(value));

// Password Field Layout
    final passwordLayout = GetBuilder<LoginController>(
      builder: (_) => TextFormField(
          controller: loginCtrl.password,
          obscureText: loginCtrl.passwordVisible,
          focusNode: loginCtrl.passwordFocus,
          decoration: LoginCommonScreen().decorationField(
            AppFont().hintpassword,
            suffixIcon: IconButton(
              iconSize: AppScreenUtil().size(20.0),
              icon: Icon(loginCtrl.passwordVisible
                  ? Icons.visibility_off
                  : Icons.visibility),
              onPressed: () {
                loginCtrl.toggle();
              },
            ),
          ),
          textInputAction: TextInputAction.done,
          validator: (value) =>
              LoginValidation().checkPasswordValidation(value)),
    );

    //forgot userId and Password Layout
    final forgotuserIdandPasswordLayout = GetBuilder<LoginController>(
      builder: (_) => InkWell(
          onTap: () {
            loginCtrl.isVisible = true;
            loginCtrl.update();
          },
          child: Container(
            alignment: Alignment.centerRight,
            child: LoginCommonScreen().commonText(AppFont().forgotUserIDPassword,
                textAlign: TextAlign.end, fontSize: 14),
          )),
    );

    //signup layout
    final signupLayout = LoginCommonScreen().signupContainerLayout(onTap: (){
      Helper().launchURL('https://prod.monitor.gorog.co/');
    });

    //forgot userId and Password Layout
    final licenceAndPrivacyLayout = Row(
      children: [
        PrivacyAndLicence(
          licenceonTap: () {
            Get.toNamed(routeName.licenseAgreement);
          },
          privacyonTap: () {
            Get.toNamed(routeName.privacyStatement);
          },
        ),
      ],
    );

    //isShow Error
    final isShowError = GetBuilder<LoginController>(builder: (_) {
      return loginCtrl.isShowError
          ? LoginCommonScreen().errorShow
          : Container();
    });

    //isShow Invali Email Error
    final isShowEmailInvalidError = GetBuilder<LoginController>(builder: (_) {
      return loginCtrl.isEmailShowError
          ? LoginCommonScreen().inValidEmailerrorShow
          : Container();
    });

// Button Layout
    final buttonLayout = GetBuilder<LoginController>(builder: (_) => LoginCommonScreen().submitButton(onTap: () {
      print('tap');
      if(loginCtrl.isVisible == false) {
        if (formKey.currentState!.validate()) loginCtrl.checkLogin();
      }else{
        if(formKey.currentState!.validate())
          loginCtrl.forgotPassword(context);
      }
    },isVisible: loginCtrl.isVisible),);

    //forgotPassword Layout
    final forgotPasswordLayotwithEmail = GetBuilder<LoginController>(
      builder: (_) => ForgotPasswordLayout(
      onTap: () => loginCtrl.isBack(),
      userLayout: userLayout,
      buttonLayout: buttonLayout,isShowError: isShowEmailInvalidError,
    ),);

    return WillPopScope(
      onWillPop: () {
        Alertbox().appClose(context);
        return new Future(() => false);
      },
      child: GetBuilder<LoginController>(
        builder: (_) => Scaffold(
          appBar: AppBar(
            backgroundColor: appColor.whiteColor,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: appColor.whiteColor,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  color: appColor.whiteColor,
                  margin: EdgeInsets.all(AppScreenUtil().size(20),),
                  child: Column(
                    children: [
                      LoginCommonScreen().body(
                          context,
                          formKey,
                          userLayout,
                          passwordLayout,
                          forgotuserIdandPasswordLayout,
                          buttonLayout,
                          licenceAndPrivacyLayout,
                          signupLayout,
                          isShowError,loginCtrl.isVisible,forgotPasswordLayotwithEmail),
                    ],
                  ),
                ),
                if (loginCtrl.isLoading) LoadingComponent()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
