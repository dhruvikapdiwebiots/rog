import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertCard.dart';
import 'package:rog/screens/alertsScreen/alertCommonScreen.dart';
import 'package:rog/screens/alertsScreen/alertScreen_controller.dart';
import 'package:rog/utils/shimmer.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({Key? key}) : super(key: key);

  @override
  _AlertsScreenState createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  var alertCtrl = Get.put(AlertScreenController());

  @override
  Widget build(BuildContext context) {

    //listing layout
    final listLayout = GetBuilder<AlertScreenController>(
      builder: (_) => alertCtrl.isLoading
          ? ShimmerCardProfileSkeleton(
        isBottomLinesActive: false,
      )
          : alertCtrl.data != null
              ? ListView.builder(
                  itemCount: alertCtrl.data.length,
                  itemBuilder: (context, index) {
                    return AlertCard(
                      data: alertCtrl.data[index],
                    );
                  },
                )
              : Container(),
    );

    return GetBuilder<AlertScreenController>(
        builder: (_) => Scaffold(
              body: /*Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: InkWell(
                    onTap: () {
                      alertCtrl.commonCtrl.sendNotification(
                          title: 'This is a tite',
                          msg:
                              'This is a message body where message is going to show');
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: appColor.primaryColor,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text('send Notification',style: TextStyle(color: appColor.whiteColor),))),
              ),*/
              Container(
                margin: EdgeInsets.all(AppScreenUtil().size(10)),
                child: AlertCommonScreen().body(
                  context,
                  listLayout,
                ),
              ),
            ));
  }
}
