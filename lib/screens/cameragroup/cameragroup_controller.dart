import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/utils/commonController.dart';
import 'package:rog/utils/helper.dart';

class CameraGroupController extends GetxController {
  var data;
  bool isLoading = false;

  //get camera group data
  getCameraListData() async {
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
            'users/${userData['uuid']}/camera-groups/', requestData, 'get');
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
    getCameraListData();
    super.onInit();
  }
}
