import 'package:flutter/material.dart';
import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/splashScreen/splashCommonScreen.dart';
import 'package:rog/utils/commonController.dart';
import 'package:rog/utils/helper.dart';

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
    getUserData();
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
    String? token = await SharedPref().getSharedPref('token');
    if (token != null && token != "") {
      bool isToken = await CommonController().checkTokenValidation();
      if (isToken) {
        Get.toNamed(routeName.dashboard);
      } else {
        Get.offAllNamed(routeName.loginScreen);
      }
    } else {
      Get.toNamed(routeName.loginScreen);
    }
  }

  //get current user data
  getUserData() async {
    try {
      List requestData = [];

      bool isToken = await CommonController().checkTokenValidation();
      if (isToken) {
        print(requestData.toString());
        var resData = await apis.apiCall(apiMethods.users, requestData, 'get');
        print('status :${resData.statusCode}');
        if (resData.statusCode == 200) {
          var data = resData.body;
          print('data : $data');
          await Helper().writeStorage('userData', data);
          setState(() {});
        } else {
          print('Error while getting userData');
        }
      } else {
        Get.offAllNamed(routeName.loginScreen);
      }
    } catch (e) {
      print(e);
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
