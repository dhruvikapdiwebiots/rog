import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertAndNoteLayout.dart';
import 'package:rog/screens/alertsScreen/alertCommonScreen.dart';
import 'package:rog/screens/alertsScreen/alertsScreen_Style.dart';
import 'package:rog/screens/alertsScreen/liveViewLayout.dart';

class AlertCard extends StatelessWidget {
  var data;
  GestureTapCallback? onTap;
  AlertCard({Key? key, this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get date in MM/dd/yyyy hh:mm: a format
    String createdDate = DateFormat('MM/dd/yyyy hh:mm a')
        .format(DateTime.parse(data["inserted_at"]));
    print('Date : ${data["inserted_at"]}');
    return Container(
      margin: EdgeInsets.only(bottom: AppScreenUtil().size(10)),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppScreenUtil().size(5)),
          child: Column(
            children: [
              AlertCommonScreen().commonText(data['camera_groups_name'],
                  fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: .5),
              AlertCommonScreen().commonText(data['cameras_name'],
                  fontSize: 14, letterSpacing: .5),
              AlertsScreenStyle().specing(5),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  InkWell(
                    onTap: onTap,
                    child: AlertCommonScreen()
                        .imageLayout(context, data['alert_image_url']),
                  ),
                  LiveViewLayout(),
                  AlertsScreenStyle().viewLiveAndAlertStyle(
                    appColor.black87Color.withOpacity(.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: AppScreenUtil().size(25)),
                          child: AlertAndNoteLayout(
                            image: iconAssets.wifi,
                            text: AppFont().alertGroup,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: AppScreenUtil().size(10)),
                          child: AlertAndNoteLayout(
                            image: iconAssets.shiled,
                            text: AppFont().addNote,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              AlertsScreenStyle().specing(15),
              AlertCommonScreen()
                  .commonText('Alert : $createdDate (PST)', fontSize: 14)
            ],
          ),
        ),
      ),
    );
  }
}
