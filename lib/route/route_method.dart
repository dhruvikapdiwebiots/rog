//app file
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/cameraCard.dart';
import 'package:rog/screens/dashboard/dashboard.dart';
import 'package:rog/screens/groupCameraList/groupCameraList.dart';
import 'package:rog/screens/licenseAgreement.dart';
import 'package:rog/screens/loginScreen/loginScreen.dart';
import 'package:rog/screens/privacyStatement.dart';
import 'package:rog/screens/splashScreen/splashScreen.dart';

import 'route_name.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.splashScreen, page: () => SplashScreen()),
    GetPage(name: _routeName.loginScreen, page: () => LoginScreen()),
    GetPage(name: _routeName.dashboard, page: () => Dashboard()),
    GetPage(name: _routeName.groupCameraList, page: () => GroupCameraList()),
    GetPage(name: _routeName.cameraCard, page: () => CameraCard()),
    GetPage(name: _routeName.privacyStatement, page: () => PrivacyStatement()),
    GetPage(name: _routeName.licenseAgreement, page: () => LicenseAgreement()),
  ];
}
