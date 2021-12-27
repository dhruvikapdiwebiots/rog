
import 'package:rog/packages/config_package.dart';

class GroupCameraListController extends GetxController {
 String name = '';

 @override
  void onInit() {
    // TODO: implement onInit
   name = Get.arguments;
   update();
    super.onInit();
  }
}
