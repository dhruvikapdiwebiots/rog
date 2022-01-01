import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertAndNoteLayout.dart';
import 'package:rog/screens/alertsScreen/alertCommonScreen.dart';
import 'package:rog/screens/alertsScreen/alertScreen_controller.dart';
import 'package:rog/screens/alertsScreen/alertsScreen_Style.dart';
import 'package:rog/screens/alertsScreen/liveViewLayout.dart';

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
      builder: (_) => ListView.builder(
        
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: AppScreenUtil().size(10)),
            child: Card(
              elevation: 5,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: AppScreenUtil().size(5)),
                child: Column(
                  children: [
                    AlertCommonScreen().commonText('ClubHouse Entrance Gate',
                        fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: .5),
                    AlertCommonScreen().commonText('Cobalt Security Seabridge',
                        fontSize: 14, letterSpacing: .5),
                    AlertsScreenStyle().specing(5),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        AlertCommonScreen().imageLayout(context, imageAssets.house2),
                        LiveViewLayout(),
                        AlertsScreenStyle().viewLiveAndAlertStyle(
                          Colors.black87.withOpacity(.8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              AlertAndNoteLayout(
                                image: iconAssets.wifi,
                                text: AppFont().alertGroup,
                              ),
                              AlertAndNoteLayout(
                                image: iconAssets.shiled,
                                text: AppFont().addNote,
                              )
                            ],
                          ),

                        )
                      ],
                    ),
                    AlertsScreenStyle().specing(15),
                    AlertCommonScreen().commonText('Alert : 11/30/2021 08:5213 PM (PST)',fontSize: 14)
                  ],
                ),
              ),
            ),
          );
        },
      ),
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
