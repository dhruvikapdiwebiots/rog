import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/CameraCardScreen_Style.dart';
import 'package:rog/screens/cameraCard/cameraCardCommonScreen.dart';
import 'package:rog/screens/cameraCard/cameraCard_controller.dart';
import 'package:rog/screens/cameraCard/viewandalertLayout.dart';
import 'package:rog/screens/dashboard/bottomNavigatorBarCommon.dart';
import 'package:rog/screens/dashboard/dashboard_Controller.dart';

class CameraCard extends StatefulWidget {
  const CameraCard({Key? key}) : super(key: key);

  @override
  _CameraCardState createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  var cameraCardCtrl = Get.put(CameraCardController());

  @override
  Widget build(BuildContext context) {
    //camera name
    final cameraNameLayout = GetBuilder<CameraCardController>(
      builder: (_) => CameraCardScreenStyle().cameraAndGroupNameStyle(
          child: Column(
        children: [
          CameraCardCommonScreen().commonText(cameraCardCtrl.name,
              fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: .5),
          CameraCardCommonScreen().commonText(cameraCardCtrl.groupname,
              fontSize: 14, letterSpacing: .5),
        ],
      )),
    );

    //image layout
    final imageLayout = GetBuilder<CameraCardController>(
      builder: (_) => cameraCardCtrl.data != null
          ? Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CameraCardCommonScreen()
                    .imageLayout(context, cameraCardCtrl.data['thumbnail_url']),
                CameraCardScreenStyle().viewLiveAndAlertStyle(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: AppScreenUtil().size(10)),
                        child: ViewAndAlertLayout(
                          image: iconAssets.view,
                          text: AppFont().viewLive,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: AppScreenUtil().size(25)),
                        child: ViewAndAlertLayout(
                          image: iconAssets.wifi,
                          text: AppFont().alertGroup,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          : Container(),
    );

    //time date display layout
    final timeDateDisplay = GetBuilder<CameraCardController>(
      builder: (_) => cameraCardCtrl.data != null
          ? Container(
              child: Column(
                children: [
                  CameraCardCommonScreen().commonText(
                      AppFont().lastImageReceived,
                      fontSize: 16,
                      color: appColor.grey),
                  CameraCardScreenStyle().specing(8),
                  CameraCardCommonScreen().commonText(cameraCardCtrl.date,
                      fontSize: 16, color: appColor.grey),
                  CameraCardScreenStyle().specing(8),
                  CameraCardCommonScreen().commonText(
                      '${cameraCardCtrl.time} PST',
                      fontSize: 16,
                      color: appColor.grey),
                ],
              ),
            )
          : Container(),
    );

    return GetBuilder<CameraCardController>(
      builder: (_) => GetBuilder<DashboardController>(
        builder: (controller) => Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: appColor.primaryColor,
              boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
              ],
            ),
            child: BottomNavigatorCard(
              selectedIndex: controller.selectedIndex,
              onTap: (index) {
                Get.back();
                Get.back();
                controller.navigationbarchange(index);
              },
            ),
          ),
          appBar: CameraCardScreenStyle()
              .appBarStyle(context, onBack: () => Get.back()),
          body: Container(
            child: CameraCardCommonScreen()
                .body(context, cameraNameLayout, imageLayout, timeDateDisplay),
          ),
        ),
      ),
    );
  }
}
