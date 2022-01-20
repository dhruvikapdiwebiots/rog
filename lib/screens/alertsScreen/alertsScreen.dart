import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertCard.dart';
import 'package:rog/screens/alertsScreen/alertCommonScreen.dart';
import 'package:rog/screens/alertsScreen/alertScreen_controller.dart';
import 'package:rog/utils/common_example_wrapper.dart';
import 'package:rog/utils/shimmer.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({Key? key}) : super(key: key);

  @override
  _AlertsScreenState createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  var alertCtrl = Get.put(AlertScreenController());

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
                        onTap: () {
                          Navigator.of(context).push(AlertImagePreview(type: 'alert',
                              image: alertCtrl.data[index]['imagesArray'])).then((value) async{
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitUp,
                              DeviceOrientation.portraitDown
                            ]);
                          });

                        });
                  },
                )
              : Container(),
    );

    return GetBuilder<AlertScreenController>(
        builder: (_) => Scaffold(
              backgroundColor: appColor.backgroundColor,
              body: Container(
                margin: EdgeInsets.all(AppScreenUtil().size(10)),
                child: AlertCommonScreen().body(
                  context,
                  listLayout,
                ),
              ),
            ));
  }
}
