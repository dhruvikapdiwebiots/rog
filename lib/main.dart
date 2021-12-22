import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/splashScreen/splashScreen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    lockScreenPortrait();
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        locale: Locale('en', 'US'),

        title: "Rog",
        home: SplashScreen(),
        theme: appTheme.lightTheme,
        darkTheme: appTheme.darkTheme,

        themeMode: themeService.getThemeMode(),
      ),
    );
  }

  lockScreenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
