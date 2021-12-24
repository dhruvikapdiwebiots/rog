import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/loginScreen/loginCommonScreen.dart';
import 'package:rog/screens/loginScreen/loginScreen_Style.dart';

class ForgotPasswordLayout extends StatefulWidget {
  Widget? userLayout;
  Widget? buttonLayout;
  GestureTapCallback? onTap;
  ForgotPasswordLayout({Key? key,this.buttonLayout,this.userLayout,this.onTap}) : super(key: key);

  @override
  _ForgotPasswordLayoutState createState() => _ForgotPasswordLayoutState();
}

class _ForgotPasswordLayoutState extends State<ForgotPasswordLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginCommonScreen().commonText(AppFont().forgotPassword,fontWeight: FontWeight.w600,fontSize: 22),
          LoginCommonScreen().commonText(AppFont().instructionForPassword,fontSize: 14,color: appColor.grey),
          LoginScreenStyle().specing(10),
          widget.userLayout!,
          LoginScreenStyle().specing(20),
          InkWell(
            onTap: widget.onTap,
            child:LoginScreenStyle().backIconStyle(child: Icon(Icons.arrow_back)),
          ),
          LoginScreenStyle().specing(50),
          widget.buttonLayout!
        ],
      ),
    );
  }
}
