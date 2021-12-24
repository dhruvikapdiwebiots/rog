import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
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
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedFontSize: 20,
              unselectedItemColor: appColor.grey,
              backgroundColor: appColor.primaryColor,
              selectedIconTheme: IconThemeData(color: Color(0xFF5EC3B4)),
              selectedItemColor: Color(0xFF5EC3B4),
              selectedLabelStyle: TextStyle(fontSize: 18),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Color(0xFF0F273D),
                  icon: Icon(Icons.people_alt_outlined),
                  label: 'Groups',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color(0xFF0F273D),
                  icon: Icon(Icons.doorbell),
                  label: 'Alerts',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color(0xFF0F273D),
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ) ,
              ],
              currentIndex: dashboardCtrl.selectedIndex,
              onTap: (index) => dashboardCtrl.navigationbarchange(index),
            ),
          ),
          appBar:  new PreferredSize(
            child: new Container(
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top
              ),
              child: new Padding(
                padding: const EdgeInsets.only(
                    left: 30.0,
                    top: 20.0,
                    bottom: 20.0
                ),
                child: new Text(
                  dashboardCtrl.selectedIndex == 0 ? 'Camera Group' : dashboardCtrl.selectedIndex == 1 ? 'Alerts' : 'Settings',
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        appColor.primaryColor,
                        appColor.primarlightColor1,
                        appColor.primarlightColor
                      ]
                  ),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey[500]!,
                      blurRadius: 20.0,
                      spreadRadius: 1.0,
                    )
                  ]
              ),
            ),
            preferredSize: new Size(
                MediaQuery.of(context).size.width,
                150.0
            ),
          ),
          body: dashboardCtrl.widgetOptions
              .elementAt(dashboardCtrl.selectedIndex),
        ),
      ),
    );
  }
}
