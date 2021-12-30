import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/settingScreen/SettingScreen_Style.dart';
import 'package:rog/screens/settingScreen/settingCommonScreen.dart';
import 'package:rog/screens/settingScreen/setting_controller.dart';
import 'package:rog/utils/loading_component.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var settingCtrl = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    //name Layout
    final naemLayout = GetBuilder<SettingController>(
        builder: (_) => SettingCommonScreen().commonLayout(settingCtrl.isEnable,
                textformfieldWidget: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: settingCtrl.controller,
                  ),
                ),
                title: settingCtrl.dashboardCtrl.name, onTap: () {
              print('tap');
              settingCtrl.isNameEdit();
            }));

    //Lastname Layout
    final lastNameLayout = GetBuilder<SettingController>(
        builder: (_) =>
            SettingCommonScreen().commonLayout(settingCtrl.isLastNameEnable,
                textformfieldWidget: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: settingCtrl.lastNameController,
                  ),
                ),
                title: settingCtrl.dashboardCtrl.lastname, onTap: () {
              print('tap');
              settingCtrl.isLastNameEdit();
            }));

    //email Layout
    final emailLayout = GetBuilder<SettingController>(
        builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingCommonScreen()
                        .commonText(AppFont().email, fontSize: 16),
                    SettingScreenStyle().specingWidth(10),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppScreenUtil().size(10),
                            horizontal: AppScreenUtil().size(15)),
                        child: SettingCommonScreen().commonText(
                          settingCtrl.dashboardCtrl.email,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ));

    // Button Layout
    final buttonLayout = GetBuilder<SettingController>(
      builder: (_) => SettingCommonScreen().submitButton(onTap: () {
        print('tap');
        settingCtrl.updateData();
      }),
    );

    return GetBuilder<SettingController>(
      builder: (_) => Scaffold(
        body: SingleChildScrollView(
          child: settingCtrl.isLoading ?  LoadingComponent() : Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(
                vertical: AppScreenUtil().size(25),
                horizontal: AppScreenUtil().size(20)),
            child: SettingCommonScreen().body(
                context, naemLayout, lastNameLayout, emailLayout, buttonLayout),
          ),
        ),
      ),
    );
  }
}
