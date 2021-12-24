//app file
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/dashboard/dashboard.dart';
import 'package:rog/screens/loginScreen/loginScreen.dart';
import 'package:rog/screens/splashScreen/splashScreen.dart';

import 'route_name.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.splashScreen, page: () => SplashScreen()),
    GetPage(name: _routeName.loginScreen, page: () => LoginScreen()),
    GetPage(name: _routeName.dashboard, page: () => Dashboard()),
  ];
}
