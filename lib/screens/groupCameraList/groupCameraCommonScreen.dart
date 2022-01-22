import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/groupCameraList/groupCameraScreen_Style.dart';
import 'package:rog/utils/custom_cached_network_image.dart';

class GroupCameraCommonScreen {
  // common Text Layout
  final commonText = (text,
          {double? fontSize,
          TextAlign? textAlign,
          Color? color,
          FontWeight? fontWeight,
          double? letterSpacing}) =>
      Text(
        text,
        textAlign: textAlign,
        style: GroupCameraScreenStyle().commonTextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing),
      );

  //imageLayout
  final imageLayout = (image, height, width) => ClipRRect(
      borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(55)),
      child: CustomCachedNetworkImage(
        url: image,
        width: AppScreenUtil().size(width),
        height: AppScreenUtil().size(height),
        fit: BoxFit.cover,
        errorLocalPath: imageAssets.house,
      ));

  //camera name Layout
  final cameraNameLayout = (text) => GroupCameraScreenStyle().cameraNameStyle(
      child: GroupCameraCommonScreen().commonText(text, fontSize: 16));


  //menu Icon Style
  final menuiconStyl = (icon) => Icon(
    icon,
    color: appColor.whiteColor,
  );

  //main body ui design
  final body = (BuildContext context, cameraNameLayout, list) => Column(
        children: [
          cameraNameLayout,
          GroupCameraScreenStyle().specing(10),
          list
        ],
      );
}
