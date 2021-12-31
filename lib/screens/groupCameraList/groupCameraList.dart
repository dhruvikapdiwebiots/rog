import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/dashboard/bottomNavigatorBarCommon.dart';
import 'package:rog/screens/dashboard/dashboard_Controller.dart';
import 'package:rog/screens/groupCameraList/groupCameraCommonScreen.dart';
import 'package:rog/screens/groupCameraList/groupCameraListCard.dart';
import 'package:rog/screens/groupCameraList/groupCameraScreen_Style.dart';
import 'package:rog/screens/groupCameraList/groupcameraList_controller.dart';

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
      builder: (_) =>  GroupCameraCommonScreen().cameraNameLayout(groupCameraCtrl.name),
    );

    return GetBuilder<GroupCameraListController>(
      builder: (_) =>  GetBuilder<DashboardController>(
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
                controller.navigationbarchange(index);},
            ),
          ),
          backgroundColor: appColor.backgroundColor,
          appBar: AppBar(
            title: GroupCameraCommonScreen().commonText(AppFont().cameragroups,fontSize: 18),
          ),
          body: Container(
            child: Column(
              children: [
                cameraNameLayout,
                GroupCameraScreenStyle().specing(10),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GroupCameraListCard(
                        onTap: (){
                          var data = {
                            'cameraName' :'Clubhouse Entrance Gate',
                            'groupName': 'Cobalt Security Seabridge'
                          };
                          Get.toNamed(routeName.cameraCard,arguments: data);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
