import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameragroup/cameraGroupCard.dart';
import 'package:rog/screens/cameragroup/cameragroup_controller.dart';
import 'package:rog/utils/shimmer.dart';

class CameraGroup extends StatefulWidget {
  const CameraGroup({Key? key}) : super(key: key);

  @override
  _CameraGroupState createState() => _CameraGroupState();
}

class _CameraGroupState extends State<CameraGroup> {
  var cameraListCtrl = Get.put(CameraGroupController());

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return GetBuilder<CameraGroupController>(
      builder: (_) => Scaffold(
        body: Container(
          margin: EdgeInsets.all(AppScreenUtil().size(15)),
          child: cameraListCtrl.isLoading
              ? ShimmerCardListSkeleton(
                  isBottomLinesActive: false,
                )
              : cameraListCtrl.data != null
                  ? ListView.builder(
                      itemCount: cameraListCtrl.data.length,
                      itemBuilder: (context, index) {
                        return CameraGroupCard(
                          data: cameraListCtrl.data[index],
                          onTap: () async{
                            cameraListCtrl.onTap(index);
                          },
                        );
                      },
                    )
                  : Container(),
        ),
      ),
    );
  }
}
