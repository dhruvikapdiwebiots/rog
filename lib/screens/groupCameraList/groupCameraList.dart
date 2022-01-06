import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/dashboard/bottomNavigatorBarCommon.dart';
import 'package:rog/screens/dashboard/dashboard_Controller.dart';
import 'package:rog/screens/groupCameraList/groupCameraCommonScreen.dart';
import 'package:rog/screens/groupCameraList/groupCameraListCard.dart';
import 'package:rog/screens/groupCameraList/groupCameraScreen_Style.dart';
import 'package:rog/screens/groupCameraList/groupcameraList_controller.dart';
import 'package:rog/utils/loading_component.dart';

class GroupCameraList extends StatefulWidget {
  const GroupCameraList({Key? key}) : super(key: key);

  @override
  _GroupCameraListState createState() => _GroupCameraListState();
}

class _GroupCameraListState extends State<GroupCameraList> {
  var groupCameraCtrl = Get.put(GroupCameraListController());

  @override
  Widget build(BuildContext context) {
    //camera name
    final cameraNameLayout = GetBuilder<GroupCameraListController>(
      builder: (_) =>
          GroupCameraCommonScreen().cameraNameLayout(groupCameraCtrl.name),
    );

    //listing layout
    final listLayout = GetBuilder<GroupCameraListController>(
      builder: (_) => Expanded(
        child: groupCameraCtrl.isLoading
            ? LoadingComponent()
            : groupCameraCtrl.data != null
                ? ListView.builder(
                    itemCount: groupCameraCtrl.data.length,
                    itemBuilder: (context, index) {
                      return GroupCameraListCard(
                        data: groupCameraCtrl.data[index],
                        onTap: () {
                          var data = {
                            'camera_groups_uuid':
                                groupCameraCtrl.camera_groups_uuid,
                            'camera_uuid': groupCameraCtrl.data[index]['uuid'],
                            'cameraName': groupCameraCtrl.name,
                            'groupName': groupCameraCtrl.data[index]['name']
                          };
                          Get.toNamed(routeName.cameraCard, arguments: data);
                        },
                      );
                    },
                  )
                : Container(),
      ),
    );

    return GetBuilder<GroupCameraListController>(
      builder: (_) => GetBuilder<DashboardController>(
        builder: (controller) => Scaffold(
          backgroundColor: appColor.lightGreyColor,
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
                controller.navigationbarchange(index);
              },
            ),
          ),
          appBar: GroupCameraScreenStyle()
              .appBarStyle(context, onBack: () => Get.back()),
          body: Container(
              child: GroupCameraCommonScreen()
                  .body(context, cameraNameLayout, listLayout)),
        ),
      ),
    );
  }
}
