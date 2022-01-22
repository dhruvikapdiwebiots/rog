import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/cameraCard/cameraCard_controller.dart';
import 'package:rog/screens/dashboard/dashboard_Controller.dart';
import 'package:rog/utils/commonController.dart';
import 'package:rog/utils/helper.dart';

class GroupCameraListController extends GetxController {
  String name = '';
  String camera_groups_uuid = '';
  String camera_uuid = '';
  DashboardController dashboardController = Get.find();

  var data;
  bool isLoading = false;

  //get camera group data
  getCameraGroupData() async {
    print('calling');
    try {
      isLoading = true;
      update();
      List requestData = [];
      var userData = await Helper().getStorage('userData');

      bool isToken = await CommonController().checkTokenValidation();
      if (isToken) {
        print(requestData.toString());
        var resData = await apis.apiCall(
            'users/${userData['uuid']}/camera-groups/${camera_groups_uuid}/cameras?guardbox=false',
            requestData,
            'get');
        print('status :${resData.statusCode}');

        if (resData.statusCode == 200) {
          data = resData.body;
          print('data : $data');
          update();
        } else {
          print('Error while getting userData');
        }
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        Get.offAllNamed(routeName.loginScreen);
      }
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }

  //ontap on camera card
  onTap(index)async{
    var cameraCardController = Get.put(CameraCardController());
    await Helper().writeStorage('camera_groups_uuid',
        camera_groups_uuid);
    await Helper().writeStorage(
        'camera_uuid', data[index]['uuid']);
    await Helper()
        .writeStorage('cameraName', name);
    await Helper()
        .writeStorage('groupName', data[index]['name']);
    update();

    var argdata = {
      'camera_groups_uuid':
      camera_groups_uuid,
      'camera_uuid': data[index]['uuid'],
      'cameraName': name,
      'groupName': data[index]['name']
    };
    print('args : $argdata');
    cameraCardController.getCameraViewData();
    cameraCardController.getStorageVal();

    Get.toNamed(routeName.cameraCard, arguments: argdata);
  }

  //onBack function
  onBack()async{
    String type = await Helper().getStorage('type');
    if (type == 'cameraview') {
      Get.offAllNamed(routeName.dashboard);
      await Helper().writeStorage('type', '');
    } else {
      Get.back();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    var args = Get.arguments;
    print('args : $args');
    if (args != null && args != "") {
      name = args['name'];
      camera_groups_uuid = args['id'];
    }
    update();
    getCameraGroupData();
    super.onInit();
  }
}
