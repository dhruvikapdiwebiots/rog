import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/groupCameraList/groupCameraCommonScreen.dart';
import 'package:rog/screens/groupCameraList/groupCameraScreen_Style.dart';

class GroupCameraListCard extends StatelessWidget {
  GestureTapCallback? onTap;
  var data;
  GroupCameraListCard({Key? key, this.onTap, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(AppScreenUtil().size(0.1)),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().size(12),
              horizontal: AppScreenUtil().size(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GroupCameraCommonScreen()
                        .imageLayout(data['thumbnail_url'], 100, 100),
                    GroupCameraScreenStyle().specingWidth(20),
                    Expanded(
                        child: GroupCameraCommonScreen().commonText(
                            data['name'],
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Image.asset(
                      iconAssets.next,
                      color: appColor.selectItemColor,
                      height: AppScreenUtil().size(20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
