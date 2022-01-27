import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';

class BottomNavigatorCard extends StatelessWidget {
  int? selectedIndex;
  ValueChanged<int>? onTap;
  String? alertCount;

  BottomNavigatorCard(
      {Key? key, this.selectedIndex, this.onTap, this.alertCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('alert : $alertCount');
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: AppScreenUtil().fontSize(22),
      unselectedItemColor: appColor.grey,
      backgroundColor: appColor.primaryColor,
      selectedItemColor: appColor.selectItemColor,
      selectedLabelStyle: TextStyle(fontSize: AppScreenUtil().size(16)),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: appColor.primaryColor,
          icon: Image.asset(
            iconAssets.users,
            color:
                selectedIndex == 0 ? appColor.selectItemColor : appColor.grey,
            height: selectedIndex == 0
                ? AppScreenUtil().size(24)
                : AppScreenUtil().size(22),
          ),
          label: AppFont().groups,
        ),
        BottomNavigationBarItem(
          backgroundColor: appColor.primaryColor,
          icon: Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                iconAssets.bell,
                color: selectedIndex == 1
                    ? appColor.selectItemColor
                    : appColor.grey,
                height: selectedIndex == 1
                    ? AppScreenUtil().size(24)
                    : AppScreenUtil().size(22),
              ),
              if (alertCount != '0')
                Positioned(
                  left: 11,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppScreenUtil().size(2),
                        horizontal: AppScreenUtil().size(4)),
                    decoration: BoxDecoration(
                        color: appColor.redColor,
                        borderRadius: BorderRadius.circular(
                            AppScreenUtil().borderRadius(50))),
                    child: Text(
                      alertCount.toString(),
                      style: TextStyle(
                          color: appColor.whiteColor,
                          fontSize: AppScreenUtil().size(6)),
                    ),
                  ),
                )
            ],
          ),
          label: AppFont().alerts,
        ),
        BottomNavigationBarItem(
          backgroundColor: appColor.primaryColor,
          icon: Image.asset(
            iconAssets.settings,
            color:
                selectedIndex == 2 ? appColor.selectItemColor : appColor.grey,
            height: selectedIndex == 2
                ? AppScreenUtil().size(24)
                : AppScreenUtil().size(20),
          ),
          label: AppFont().setting,
        ),
      ],
      currentIndex: selectedIndex!,
      onTap: onTap,
    );
  }
}
