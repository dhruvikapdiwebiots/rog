//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String? url;
  final String? errorLocalPath;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomCachedNetworkImage(
      {Key? key,
      this.url,
      this.errorLocalPath,
      this.height,
      this.width,
      this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: ExactAssetImage(imageAssets.cameraNote),
      image: NetworkImage(url!),
      height: AppScreenUtil().size(height!),
      width: AppScreenUtil().size(width!),
      fit: fit,
      imageErrorBuilder:
          (BuildContext? context, Object? exception, StackTrace? stackTrace) {
        return Image.asset(
          errorLocalPath!,
          height: AppScreenUtil().size(height!),
          width: AppScreenUtil().size(width!),
          fit: fit,
        );
      },
    );
  }
}
