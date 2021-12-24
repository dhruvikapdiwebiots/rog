import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/loginScreen/loginCommonScreen.dart';
import 'package:rog/screens/loginScreen/loginScreen_Style.dart';
import 'package:rog/screens/loginScreen/login_controller.dart';
import 'package:rog/screens/loginScreen/privacyAndLicence.dart';
import 'package:rog/utils/loading_component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginCtrl = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  // Submit click event
  submitClick(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    //focus change
    _fieldFocusChange(BuildContext context, FocusNode currentFocus,
        FocusNode nextFocus) {
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
        validator: (value) => value!.isEmpty ? AppFont().userFieldError : null);

// Password Field Layout
    final passwordLayout = GetBuilder<LoginController>(
      builder: (_) =>
          TextFormField(
              controller: loginCtrl.password,
              obscureText: loginCtrl.passwordVisible,
              focusNode: loginCtrl.passwordFocus,
              decoration: LoginCommonScreen().decorationField(
                AppFont().hintpassword,
                suffixIcon: IconButton(
                  iconSize: AppScreenUtil().size(20.0),
                  icon: Icon(loginCtrl.passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    loginCtrl.toggle();
                  },
                ),
              ),
              textInputAction: TextInputAction.done,
              validator: (value) =>
              value!.isEmpty ? AppFont().passwordFieldError : null),
    );

    //forgot userId and Password Layout
    final forgotuserIdandPasswordLayout = InkWell(
        onTap: () {},
        child: LoginCommonScreen().commonText(AppFont().forgotUserIDPassword,
            textAlign: TextAlign.end, fontSize: 14));

    //signup layout
    final signupLayout = InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          child: Text(
            AppFont().signupForFree,
            style: TextStyle(
                fontSize: AppScreenUtil().fontSize(18),
                decoration: TextDecoration.underline,
                color: appColor.blackColor,
                fontWeight: FontWeight.w500),
          ),
        ));

    //forgot userId and Password Layout
    final licenceAndPrivacyLayout = Row(
      children: [
        PrivacyAndLicence(
          licenceonTap: () {
            print('Tapped on hyperlink');
          },
          privacyonTap: () {
            print('Tapped on 1');
          },
        ),
      ],
    );

    //isShow Error
    final isShowError = GetBuilder<LoginController>(
        builder: (_) {
          return loginCtrl.isShowError ? Container(alignment:Alignment.center,child: Text('Invalid email or password',style: TextStyle(color: appColor.redColor),)) : Container();
        } );

// Button Layout
    final buttonLayout = LoginCommonScreen().submitButton(onTap: () {
      print('tap');
      loginCtrl.checkLogin();
    });

    return WillPopScope(
      onWillPop: () {
        Alertbox().appClose(context);
        return new Future(() => false);
      },
      child: GetBuilder<LoginController>(
        builder: (_) =>
            Scaffold(
              backgroundColor: appColor.whiteColor,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      color: appColor.whiteColor,
                      margin: EdgeInsets.only(
                          top: AppScreenUtil().size(40),
                          left: AppScreenUtil().size(20),
                          right: AppScreenUtil().size(20),
                          bottom: AppScreenUtil().size(20)),
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
                              signupLayout,isShowError),
                        ],
                      ),
                    ),
                    if(loginCtrl.isLoading)
                      Container(
                        color: Colors.white.withOpacity(0.6),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Material(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      appColor.primaryColor),
                                  strokeWidth: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
