import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/utils/commonController.dart';
import 'package:rog/utils/helper.dart';

class AlertScreenController extends GetxController {
  CommonController commonCtrl = Get.find();
  var data;
  bool isLoading = false;
  int length =0;

  //get alert data
  getAlertData() async {
    print('calling');
    try {
      isLoading = true;
      update();
      List requestData = [];
      var userData = await Helper().getStorage('userData');
      var alertCount = await Helper().getStorage('alertCount');
      print('alertCount : $alertCount');

      bool isToken = await CommonController().checkTokenValidation();
      if (isToken) {
        print(requestData.toString());
        var resData = await apis.apiCall(
            'users/${userData['uuid']}/alerts', requestData, 'get');
        print('status :${resData.statusCode}');
        if (resData.statusCode == 200) {

          for(var i =0;i<resData.body.length;i++){
            var imagedata =[
              resData.body[i]['alert_image_url'],
            ];
            resData.body[i]['imagesArray'] = imagedata;
          }
          data = resData.body;
          print('alertData : $data');
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
    getAlertData();
    super.onInit();
  }
}
