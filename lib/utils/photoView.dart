import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:rog/packages/config_package.dart';

class PhotoViewLayout extends StatefulWidget {
  List? image;
   PhotoViewLayout({Key? key,this.image}) : super(key: key);

  @override
  _PhotoViewLayoutState createState() => _PhotoViewLayoutState();
}

class _PhotoViewLayoutState extends State<PhotoViewLayout> {
  PageController? pageController;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Hero(
          tag: "Sliderimage",
          child: PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            onPageChanged: (int index){
              currentIndex = index;
              setState(() { });
            },
            builder: (BuildContext context, int index) {
              print('images show : ${widget.image![index]}');
              return PhotoViewGalleryPageOptions(

                imageProvider: NetworkImage(widget.image![index]),
                initialScale: PhotoViewComputedScale.contained * 0.8,
                errorBuilder: (_, __, ___) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: appColor.blackColor,
                    child: Center(

                      child: Image.asset(imageAssets.house,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
                    ),
                  );
                },
              );
            },
            itemCount: widget.image!.length,

            backgroundDecoration: const BoxDecoration(
              color: Colors.black,
            ),
            pageController: pageController,
          )
      ),
    );
  }
}
