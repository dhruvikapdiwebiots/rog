import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertAndNoteLayout.dart';
import 'package:rog/screens/alertsScreen/alertCommonScreen.dart';
import 'package:rog/screens/alertsScreen/alertsScreen_Style.dart';
import 'package:rog/screens/alertsScreen/liveViewLayout.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppScreenUtil().size(10)),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppScreenUtil().size(5)),
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
              AlertCommonScreen().commonText(
                  'Alert : 11/30/2021 08:5213 PM (PST)',
                  fontSize: 14)
            ],
          ),
        ),
      ),
    );
  }
}
