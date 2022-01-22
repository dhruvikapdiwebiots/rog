import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameragroup/cameraGroupCommonScreen.dart';
import 'package:rog/screens/cameragroup/cameraGroupScreen_Style.dart';

class CameraGroupCard extends StatelessWidget {
  GestureTapCallback? onTap;
  var data;

  CameraGroupCard({Key? key, this.onTap, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Container(
          height: AppScreenUtil().size(150),
          child: Padding(
            padding: EdgeInsets.all(AppScreenUtil().size(12)),
            child: Row(
              children: [
                CameraGroupScreenStyle().specingWidth(30),
                CameraGroupScreenStyle().cameraIconStyle,
                CameraGroupScreenStyle().specingWidth(15),
                Expanded(
                  child: CameraGroupCommonScreen().commonText(data['name'],
                      textAlign: TextAlign.center,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
