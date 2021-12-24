import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameragroup/cameraGroupCard.dart';

class CameraGroup extends StatefulWidget {
  const CameraGroup({Key? key}) : super(key: key);

  @override
  _CameraGroupState createState() => _CameraGroupState();
}

class _CameraGroupState extends State<CameraGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(AppScreenUtil().size(15)),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return CameraGroupCard();
          },
        ),
      ),
    );
  }
}
