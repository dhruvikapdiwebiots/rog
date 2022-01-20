import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/utils/helper.dart';
import 'package:rog/utils/photoView.dart';

//Alert Image Privew
class AlertImagePreview extends ModalRoute<void> {
  List? image;
  String? type;

  AlertImagePreview({this.image,this.type});

  int currentIndex = 0;

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    // This makes sure that text and other content follows the material style
    return WillPopScope(
      onWillPop: () async {
        await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        if(type == "alert") {
          await Helper().writeStorage('selectedIndex', 1);
        }else{
          await Helper().writeStorage('selectedIndex', 0);
        }
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
    PageController? pageController;

    return Stack(
      children: <Widget>[
        PhotoViewLayout(
          image: image,
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
              if(type == "alert") {
                await Helper().writeStorage('selectedIndex', 1);
              }else{
                await Helper().writeStorage('selectedIndex', 0);
              }
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


class imageSlider extends StatefulWidget {
  dynamic? image;
  String? total;
  String? type;

  imageSlider({this.image,  this.total,this.type});

  @override
  _imageSliderState createState() => _imageSliderState();
}

class _imageSliderState extends State<imageSlider> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = 0;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return WillPopScope(
      onWillPop: () async {
        await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        if(widget.type == "alert") {
          await Helper().writeStorage('selectedIndex', 1);
        }else{
          await Helper().writeStorage('selectedIndex', 0);
        }
        Get.offAllNamed(routeName.dashboard);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                  color: Colors.black,
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: NetworkImage(widget.image![index]),
                        initialScale: PhotoViewComputedScale.contained * 0.8,
                      );
                    },
                    itemCount: widget.image.length,
                    loadingBuilder: (context,dynamic event) => Center(
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes,
                        ),
                      ),
                    ),
                    onPageChanged: onPageChanged,
                  )),

              Positioned(
                right: 10,
                top: 10,
                child: Container(

                  child: IconButton(
                    color: Colors.white,
                    onPressed: ()async {
                      await SystemChrome.setPreferredOrientations(
                          DeviceOrientation.values);
                      await SystemChrome.setEnabledSystemUIOverlays(
                          SystemUiOverlay.values);
                      await SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                        DeviceOrientation.portraitDown
                      ]);
                      if(widget.type == "alert") {
                        await Helper().writeStorage('selectedIndex', 1);
                      }else{
                        await Helper().writeStorage('selectedIndex', 0);
                      }
                      Get.offAllNamed(routeName.dashboard);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

