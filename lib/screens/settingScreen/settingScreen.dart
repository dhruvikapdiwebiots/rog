import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/settingScreen/SettingScreen_Style.dart';
import 'package:rog/screens/settingScreen/settingCommonScreen.dart';
import 'package:rog/screens/settingScreen/setting_controller.dart';

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
        builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SettingCommonScreen()
                        .commonText(AppFont().name, fontSize: 18),
                    SettingScreenStyle().specingWidth(10),
                    settingCtrl.isEnable ? Container(
                      width: 150,
                      child: TextFormField(
                        controller: settingCtrl.controller,
                      ),
                    ) : Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppScreenUtil().size(10),
                            horizontal: AppScreenUtil().size(15)),
                        child:  SettingCommonScreen().commonText(
                                settingCtrl.dashboardCtrl.name,
                                fontSize: 14),
                      ),
                    )
                  ],
                ),
                InkWell(
                    onTap: () {
                      settingCtrl.isEnable = !settingCtrl.isEnable;
                      settingCtrl.update();
                    },
                    child: Icon(Icons.edit))
              ],
            ));

    //Lastname Layout
    final lastNameLayout = GetBuilder<SettingController>(
        builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SettingCommonScreen()
                        .commonText(AppFont().lastname, fontSize: 18),
                    SettingScreenStyle().specingWidth(10),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppScreenUtil().size(10),
                            horizontal: AppScreenUtil().size(15)),
                        child: SettingCommonScreen().commonText(
                            settingCtrl.dashboardCtrl.lastname,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
                Icon(Icons.edit)
              ],
            ));

    //email Layout
    final emailLayout = GetBuilder<SettingController>(
        builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SettingCommonScreen()
                        .commonText(AppFont().email, fontSize: 18),
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
      }),
    );

    return GetBuilder<SettingController>(
      builder: (_) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
