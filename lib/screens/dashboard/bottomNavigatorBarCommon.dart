import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';

class BottomNavigatorCard extends StatelessWidget {
  int? selectedIndex;
  ValueChanged<int>? onTap;

  BottomNavigatorCard({Key? key, this.selectedIndex,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: AppScreenUtil().fontSize(20),
      unselectedItemColor: appColor.grey,
      backgroundColor: appColor.primaryColor,
      selectedItemColor: appColor.selectItemColor,
      selectedLabelStyle: TextStyle(fontSize: AppScreenUtil().size(16)),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: appColor.primaryColor,
          icon: Image.asset(
            iconAssets.users,
            color: selectedIndex == 0 ? appColor.selectItemColor : appColor.grey,
            height: selectedIndex == 0
                ? AppScreenUtil().size(23)
                : AppScreenUtil().size(20),
          ),
          label: AppFont().groups,
        ),
        BottomNavigationBarItem(
          backgroundColor: appColor.primaryColor,
          icon: Image.asset(
            iconAssets.shield,
            color: selectedIndex == 1 ? appColor.selectItemColor : appColor.grey,
            height: selectedIndex == 1
                ? AppScreenUtil().size(23)
                : AppScreenUtil().size(20),
          ),
          label: AppFont().connect,
        ),
        BottomNavigationBarItem(
          backgroundColor: appColor.primaryColor,
          icon: Image.asset(
            iconAssets.bell,
            color: selectedIndex == 2 ? appColor.selectItemColor : appColor.grey,
            height: selectedIndex == 2
                ? AppScreenUtil().size(23)
                : AppScreenUtil().size(20),
          ),
          label: AppFont().alerts,
        ),
        BottomNavigationBarItem(
          backgroundColor: appColor.primaryColor,
          icon: Image.asset(
            iconAssets.settings,
            color: selectedIndex == 3 ? appColor.selectItemColor : appColor.grey,
            height: selectedIndex == 3
                ? AppScreenUtil().size(23)
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
