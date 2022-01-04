import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
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

  @override
  void onInit() {
    // TODO: implement onInit
    var args = Get.arguments;
    name = args['name'];
    camera_groups_uuid = args['id'];
    update();
    getCameraGroupData();
    super.onInit();
  }
}
