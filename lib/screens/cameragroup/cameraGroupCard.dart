import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameragroup/cameraGroupCommonScreen.dart';
import 'package:rog/screens/cameragroup/cameraGroupScreen_Style.dart';

class CameraGroupCard extends StatelessWidget {
  const CameraGroupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(AppScreenUtil().size(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CameraGroupCommonScreen()
                      .imageLayout(imageAssets.house, 130, 130),
                  CameraGroupScreenStyle().specingWidth(10),
                  Expanded(
                      child: CameraGroupCommonScreen().commonText(
                    'Cobalt Security Seabridge',
                    textAlign: TextAlign.center,
                    fontSize: 18,
                  )),
                ],
              ),
            ),
            CameraGroupScreenStyle().cameraIconStyle
          ],
        ),
      ),
    );
  }
}