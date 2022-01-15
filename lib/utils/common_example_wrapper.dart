import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/utils/helper.dart';

class AlertImagePreview extends ModalRoute<void> {
  String? image;

  AlertImagePreview({this.image});

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  String nn = "";

  @override
  void dispose() async {
    // TODO: implement dispose
    await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return WillPopScope(
      onWillPop: () async {
        await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        await Helper().writeStorage('selectedIndex', 1);
        Get.offAllNamed(routeName.dashboard);
        return false;
      },
      child: Material(
        type: MaterialType.transparency,
        // make sure that the overlay content is not cut off
        child: SafeArea(
          child: _buildOverlayContent(context),
        ),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    print('image URl : ' + image!);
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Hero(
            tag: "Sliderimage",
            child: PhotoView(
              imageProvider: NetworkImage(image!),
            ),
          ),
        ),
        Positioned(
          //width: MediaQuery.of(context).size.width,
          right: 10,
          child: IconButton(
            color: Colors.white,
            onPressed: () async {
              await SystemChrome.setPreferredOrientations(
                  DeviceOrientation.values);
              await SystemChrome.setEnabledSystemUIOverlays(
                  SystemUiOverlay.values);
              await SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown
              ]);
              await Helper().writeStorage('selectedIndex', 1);
              Get.offAllNamed(routeName.dashboard);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}

class ImagePreview extends ModalRoute<void> {
  String? image;

  ImagePreview({this.image});

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  String nn = "";

  @override
  void dispose() async {
    // TODO: implement dispose
    await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return WillPopScope(
      onWillPop: () async {
        await Helper().writeStorage('selectedIndex', 0);
        Get.offAllNamed(routeName.dashboard);
        return false;
      },
      child: Material(
        type: MaterialType.transparency,
        // make sure that the overlay content is not cut off
        child: SafeArea(
          child: _buildOverlayContent(context),
        ),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    print('image URl : ' + image!);
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Hero(
            tag: "Sliderimage",
            child: PhotoView(
              imageProvider: NetworkImage(image!),
            ),
          ),
        ),
        Positioned(
          //width: MediaQuery.of(context).size.width,
          right: 10,
          child: IconButton(
            color: Colors.white,
            onPressed: () async {
              Get.offAllNamed(routeName.dashboard);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
