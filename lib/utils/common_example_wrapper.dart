import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rog/packages/config_package.dart';

class CommonExampleRouteWrapper extends StatelessWidget {
  const CommonExampleRouteWrapper({
    this.imageProvider,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialScale,
    this.basePosition = Alignment.center,
    this.filterQuality = FilterQuality.none,
    this.disableGestures,
    this.errorBuilder,
    this.enableRotation = false,
  });

  final ImageProvider? imageProvider;
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final dynamic initialScale;
  final Alignment basePosition;
  final FilterQuality filterQuality;
  final bool? disableGestures;
  final ImageErrorWidgetBuilder? errorBuilder;
  final bool? enableRotation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            PhotoView(
              imageProvider: imageProvider,
              loadingBuilder: loadingBuilder,
              backgroundDecoration: backgroundDecoration,
              minScale: minScale,
              maxScale: maxScale,
              initialScale: initialScale,
              basePosition: basePosition,
              filterQuality: filterQuality,
              disableGestures: disableGestures,
              enableRotation: enableRotation!,
              errorBuilder: errorBuilder,
            ),
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                margin: EdgeInsets.only(
                    right: AppScreenUtil().size(20),
                    top: AppScreenUtil().size(100)),
                decoration: BoxDecoration(
                    color: appColor.whiteColor,
                    borderRadius:
                        BorderRadius.circular(AppScreenUtil().size(50))),
                child: Icon(
                  Icons.cancel,
                  size: AppScreenUtil().size(24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
