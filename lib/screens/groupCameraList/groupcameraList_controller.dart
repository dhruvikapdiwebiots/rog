
import 'package:rog/packages/config_package.dart';
import 'package:rog/screens/dashboard/dashboard_Controller.dart';

class GroupCameraListController extends GetxController {
 String name = '';
 DashboardController dashboardController =Get.find();

 @override
  void onInit() {
    // TODO: implement onInit
   name = Get.arguments;
   update();
    super.onInit();
  }
}
