import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/splashScreen/splashCommonScreen.dart';
import 'package:rog/screens/splashScreen/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin {
  var splashCtrl = Get.put(SplashController());

  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 700), vsync: this);
    _controller!.repeat(reverse: true);
  }

  @override
  void dispose(){
    super.dispose();
    this._controller!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (_) {
        return Scaffold(
            backgroundColor: appColor.primarlightColor,
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       /* SplashCommonScreen().imageLayout,*/
                        Align(
                          child: ScaleTransition(
                            scale: Tween(begin: 0.75, end: 2.0)
                                .animate(CurvedAnimation(
                                parent: _controller!,
                                curve: Curves.elasticOut
                            )
                            ),
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: SplashCommonScreen().imageLayout,
                            ),
                          ),
                        ),
                        SplashCommonScreen().specing(20),
                        SplashCommonScreen().alertText
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
