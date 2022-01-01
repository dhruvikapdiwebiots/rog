import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/splashScreen/splashCommonScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Tween<double> _tween = Tween(begin: 0.55, end: 2);

  @override
  void initState() {
    // TODO: implement initState
    //animate the image
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller!.repeat(reverse: true);

    Future.delayed(Duration(seconds: 3), () {
      checkLogin();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();
    super.dispose();
  }

  //check wether user already login or not
  void checkLogin() async {
    String? token =await SharedPref().getSharedPref('token');
    if(token != null && token != ""){
      Get.toNamed(routeName.dashboard);
    }else {
      Get.toNamed(routeName.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColor.primaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: ScaleTransition(
                        scale: _tween.animate(CurvedAnimation(
                            parent: _controller!, curve: Curves.elasticOut)),
                        child: SplashCommonScreen().imageLayout,
                      ),
                    ),
                    SplashCommonScreen().specing(50),
                    SplashCommonScreen().alertText,
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
