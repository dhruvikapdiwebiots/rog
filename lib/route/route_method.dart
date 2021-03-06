//app file
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/cameraCard.dart';
import 'package:rog/screens/dashboard/dashboardIndex.dart';
import 'package:rog/screens/groupCameraList/groupCameraList.dart';
import 'package:rog/screens/loginScreen/loginScreen.dart';
import 'package:rog/screens/splashScreen/splashScreen.dart';
import 'package:rog/screens/webViewPage.dart';

import 'route_name.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.splashScreen, page: () => SplashScreen()),
    GetPage(name: _routeName.loginScreen, page: () => LoginScreen()),
    GetPage(name: _routeName.dashboard, page: () => DashboardIndex()),
    GetPage(name: _routeName.groupCameraList, page: () => GroupCameraList()),
    GetPage(name: _routeName.cameraCard, page: () => CameraCard()),
    GetPage(name: _routeName.webView, page: () => WebViewPage()),
  ];
}
