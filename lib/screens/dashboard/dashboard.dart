import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/dashboard/bottomNavigatorBarCommon.dart';
import 'package:rog/screens/dashboard/dashboardScreen_Style.dart';
import 'package:rog/screens/dashboard/dashboard_Controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var dashboardCtrl = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_) => WillPopScope(
        onWillPop: () {
          Alertbox().appClose(context);
          return new Future(() => false);
        },
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: appColor.primaryColor,
              boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
              ],
            ),
            child: BottomNavigatorCard(
              selectedIndex: dashboardCtrl.selectedIndex,
              onTap: (index) => dashboardCtrl.navigationbarchange(index),
            ),
          ),
          appBar: DashboardScreenStyle().appBarStyle(context,dashboardCtrl.selectedIndex),
          body: dashboardCtrl.widgetOptions
              .elementAt(dashboardCtrl.selectedIndex),
        ),
      ),
    );
  }
}
