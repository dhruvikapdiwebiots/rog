import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertCommonScreen.dart';
import 'package:rog/screens/alertsScreen/alertsScreen_Style.dart';

class LiveViewLayout extends StatelessWidget {
  const LiveViewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: AlertsScreenStyle().viewLiveAndAlertStyle(
          appColor.darkGray.withOpacity(.8),
          child: Row(
            children: [
              AlertsScreenStyle().specingWidth(15),
              Image.asset(
                iconAssets.view,
                height: AppScreenUtil().size(23),
              ),
              AlertsScreenStyle().specingWidth(15),
              AlertCommonScreen().commonText(AppFont().viewLive,
                  fontSize: 12, letterSpacing: .5, color: appColor.whiteColor)
            ],
          ),
        ),
      ),
    );
  }
}
