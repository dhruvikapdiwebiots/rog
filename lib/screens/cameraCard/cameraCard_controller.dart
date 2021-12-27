import 'package:rog/packages/config_package.dart';

class CameraCardController extends GetxController {
 String name = '';
 String groupname = '';

 @override
  void onInit() {
    // TODO: implement onInit
   var data = Get.arguments;
   name = data['cameraName'];
   groupname = data['groupName'];
   update();
    super.onInit();
  }
}
