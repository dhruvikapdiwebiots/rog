import 'package:flutter/services.dart';
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
  String alertCount = '';
  CommonController commonController = Get.find();
  AlertScreenController alertController = Get.find();

  //list of bottomnavigator page
  List<Widget> widgetOptions = <Widget>[
    CameraGroup(),
    AlertsScreen(),
    SettingScreen()
  ];


  //on back from different page take it to last visit page
  onBack() async {
    int index = await Helper().getStorage('selectedIndex');
    String alertMessage = await Helper().getStorage('alertMessage');
    if(alertMessage != '' && alertMessage == 'true'){
      await Helper().writeStorage('alertMessage', '');
    }
    selectedIndex = index;

    update();
  }

  //navigation bar change
  navigationbarchange(int index) async {
    String type = await Helper().getStorage('type');
    if (type == 'cameraview' && type != "") {
      await Helper().writeStorage('type', '');
    }
    await Helper().writeStorage('selectedIndex', selectedIndex);
    selectedIndex = index;
    print('index : ' + index.toString());
    update();
    if (selectedIndex == 1) {
      alertController.getAlertData();
      await Helper().writeStorage('alertCount', '0');
      update();
    }
    if (selectedIndex == 2) {
      dynamic userData = await Helper().getStorage('userData');
      name = userData['first_name'];
      lastname = userData['last_name'];
      email = userData['email'];
      print('name : $name');
      update();
    }
    String alertMessage = await Helper().getStorage('alertMessage');
    if(alertMessage != '' && alertMessage == 'true'){
      await Helper().writeStorage('alertMessage', '');
      commonController.alertCount = '0';
      update();
    }
  }

  //get selected Bottom Navigation Index Value
  getselectIndex() async {
    print('getselecteIndex');
    int index = await Helper().getStorage('selectedIndex');
    alertCount = await Helper().getStorage('alertCount');
    var alertMessage = await Helper().getStorage('alertMessage');
    print('alertMes : $alertMessage');
    if(alertMessage == 'true' && alertCount != ''){
      print('tap');
      selectedIndex = 1;
      await Helper().writeStorage('selectedIndex', selectedIndex);
    }
    print('selectedIndex : $index');
    if (index == 1) {
      selectedIndex = 1;
      update();
    } else {
      selectedIndex = 0;
    }
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    update();
  }


  //getNotificaton Data
  getNotificationData()async{
    var alertMessage = await Helper().getStorage('alertMessage');
    print('alertMes : $alertMessage');
    if(alertMessage == 'true'){
      print('tap');
      selectedIndex = 1;
      await Helper().writeStorage('selectedIndex', selectedIndex);
    }
  }

  //Save the Bottom Navigation at 0 Index
  saveIndex() async {
    await Helper().writeStorage('selectedIndex', 0);
    update();
  }

  //Check Whether last page visit is cameraview and according to
  //that fetch value and send to camera view page
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

  @override
  void onReady() {
    // TODO: implement onReady
    getNotificationData();
    super.onReady();
  }
}
