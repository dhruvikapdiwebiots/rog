import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/CameraCardScreen_Style.dart';
import 'package:rog/screens/cameraCard/cameraCardCommonScreen.dart';
import 'package:rog/screens/cameraCard/cameraCard_controller.dart';
import 'package:rog/screens/cameraCard/viewandalertLayout.dart';
import 'package:rog/screens/dashboard/bottomNavigatorBarCommon.dart';
import 'package:rog/screens/dashboard/dashboard_Controller.dart';
import 'package:rog/utils/common_example_wrapper.dart';
import 'package:rog/utils/helper.dart';

class CameraCard extends StatefulWidget {
  const CameraCard({Key? key}) : super(key: key);

  @override
  _CameraCardState createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  var cameraCardCtrl = Get.put(CameraCardController());


  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    // TODO: implement initState

    //get argument data coming from last visiting page
    var data = Get.arguments;
    cameraCardCtrl.name = data['cameraName'];
    cameraCardCtrl.groupname = data['groupName'];

    print('name : ${cameraCardCtrl.name}');
    print('groupName : ${cameraCardCtrl.groupname}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

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
      builder: (_) => cameraCardCtrl.data != null && cameraCardCtrl.data != ""
          ? Stack(
              alignment: Alignment.bottomCenter,
              children: [
                InkWell(
                  onTap: () async {
                    await Helper().writeStorage('type', 'cameraview');
                    Navigator.of(context).push(AlertImagePreview(type: 'cameraview',
                        image: cameraCardCtrl.data['imagesArray']));
                  },
                  child: CameraCardCommonScreen().imageLayout(
                      context, cameraCardCtrl.data['thumbnail_url']),
                ),
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
      builder: (_) => GetBuilder<DashboardController>(builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            cameraCardCtrl.onBackFunction();
            return false;
          },
          child: Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: appColor.primaryColor,
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: appColor.blackColor.withOpacity(.1))
                ],
              ),
              child: BottomNavigatorCard(
                alertCount: cameraCardCtrl.commonController.alertCount,
                selectedIndex: controller.selectedIndex,
                onTap: (index) async {
                  Get.back();
                  Get.back();
                  controller.navigationbarchange(index);
                },
              ),
            ),
            appBar:
                CameraCardScreenStyle().appBarStyle(context, onBack: () async {
              cameraCardCtrl.onBackAppBar();
            }),
            body: Container(
              child: CameraCardCommonScreen().body(
                  context, cameraNameLayout, imageLayout, timeDateDisplay),
            ),
          ),
        );
      }),
    );
  }


}
