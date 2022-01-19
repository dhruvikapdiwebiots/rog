import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/alertsScreen/alertScreen_controller.dart';
import 'package:rog/screens/alertsScreen/alertsScreen.dart';
import 'package:rog/screens/cameragroup/cameragroup.dart';
import 'package:rog/screens/settingScreen/settingScreen.dart';
import 'package:rog/utils/commonController.dart';
import 'package:rog/utils/helper.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;
  String name = '';
  String lastname = '';
  String email = '';
  CommonController commonController = Get.find();
  AlertScreenController alertController = Get.  find();


  //list of bottomnavigator page
  List<Widget> widgetOptions = <Widget>[
    CameraGroup(),
    AlertsScreen(),
    SettingScreen()
  ];

  //on back from different page take it to last visit page
  onBack() async {
    int index = await Helper().getStorage('selectedIndex');
    selectedIndex = index;
    update();
  }

  //navigation bar change
  navigationbarchange(int index) async {
    String type = await Helper().getStorage('type');
    if (type == 'cameraview' && type !="") {
      await Helper().writeStorage('type', '');
    }
    await Helper().writeStorage('selectedIndex', selectedIndex);
    selectedIndex = index;
    print('index : ' + index.toString());
    update();
    if (selectedIndex == 1) {
      alertController.getAlertData();
    }
    if (selectedIndex == 2) {
      dynamic userData = await Helper().getStorage('userData');
      name = userData['first_name'];
      lastname = userData['last_name'];
      email = userData['email'];
      print('name : $name');
      update();
    }
  }

  getselectIndex() async {
    int index = await Helper().getStorage('selectedIndex');
    print('selectedIndex : $index');
    if (index == 1) {
      selectedIndex = 1;
      update();
    } else {
      selectedIndex = 0;
    }
    update();
  }

  saveIndex() async {
    await Helper().writeStorage('selectedIndex', 0);
    update();
  }

  checkType() async {
    await Helper().writeStorage('selectedIndex', 0);
    String type = await Helper().getStorage('type');
    if (type == 'cameraview' && type != "") {
      String name = await Helper().getStorage('cameraName');
      String groupname = await Helper().getStorage('groupName');
      String cameraGroupId = await Helper().getStorage('camera_groups_uuid');
      String cameraId = await Helper().getStorage('camera_uuid');
      print('name : $name');
      print('groupname : $groupname');
      var data = {
        'camera_groups_uuid': cameraGroupId,
        'camera_uuid': cameraId,
        'cameraName': name,
        'groupName': groupname
      };

      Get.toNamed(routeName.cameraCard, arguments: data);
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getselectIndex();
    saveIndex();
    checkType();
    super.onInit();
  }
}
