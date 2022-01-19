import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/CameraCardScreen_Style.dart';
import 'package:rog/screens/groupCameraList/groupCameraScreen_Style.dart';
import 'package:rog/screens/loginScreen/loginScreen_Style.dart';
import 'package:rog/utils/custom_cached_network_image.dart';

class CameraCardCommonScreen {
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
        style: LoginScreenStyle().commonTextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing),
      );

  //camera name Layout
  final cameraNameLayout = (text) => GroupCameraScreenStyle().cameraNameStyle(
      child: CameraCardCommonScreen().commonText(text, fontSize: 16));

  //menu Icon Style
  final menuiconStyl = (icon) => Icon(
        icon,
        color: appColor.whiteColor,
      );

  //imageLayout
  final imageLayout = (
    context,
    image,
  ) =>
      CustomCachedNetworkImage(
        url: image,
        width: AppScreenUtil().size(400),
        height: AppScreenUtil().size(300),
        fit: BoxFit.cover,
        errorLocalPath: imageAssets.cameraNote,
      );

  //main body ui design
  final body =
      (BuildContext context, cameraNameLayout, imageLayout, timeDateDisplay) =>
          SingleChildScrollView(
            child: Column(
              children: [
                cameraNameLayout,
                CameraCardScreenStyle().colorSpace,
                imageLayout,
                CameraCardScreenStyle().specing(10),
                timeDateDisplay,
                CameraCardScreenStyle().specing(20),
              ],
            ),
          );
}
