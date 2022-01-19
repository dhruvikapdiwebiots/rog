import 'package:rog/packages/config_package.dart';

class SplashCommonScreen {
  //imageLayout
  final imageLayout = Image.asset(
    imageAssets.logo,
    height: appScreenUtil.size(80),
    width: appScreenUtil.size(80),
    fit: BoxFit.contain,
  );

  // Speacing
  final specing = (data) => SizedBox(
    height: AppScreenUtil().size(data),
  );

  //alertText
final alertText = Text(
  AppFont().alertLoading,
  style: TextStyle(color: appColor.whiteColor,fontSize: AppScreenUtil().fontSize(18)),
);

}
