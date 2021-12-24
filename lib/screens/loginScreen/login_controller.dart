import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/utils/helper.dart';

class LoginController extends GetxController {
  bool passwordVisible = true;
  bool changeButton = false;
  bool isLoading = false;
  var user = TextEditingController();
  var password = TextEditingController();
  final FocusNode userFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  dynamic title = '';
  bool isShowError = false;

  // Toggle Between Password show
  void toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  checkLogin() async {
    isLoading = true;
    update();
    if (user.text != "" && password.text != "") {
      isShowError = false;
      update();
      try {
        var requestData = {
          "email": user.text,
          "password": password.text,
        };

        print(requestData.toString());
        var resData = await apis.postApi(apiMethods.login, requestData);
        print('status :${resData.statusCode}');
        if (resData.statusCode == 200) {
          isLoading = false;
          print(resData.body['jwt']);
          if (resData.body['jwt'] != null && resData.body['jwt'] != "") {
            dynamic data = resData.body['jwt'];
            print('jwt : $data');
            SharedPref().save('token', 'data');
            update();
            Alertbox().successMessage('Login Successfully');

            Get.toNamed(routeName.dashboard);
          } else {
            isShowError = true;
            print(resData.data);

            Alertbox().alertMessage('Might be some issue while Login');
          }
        } else {
          isLoading = false;
          isShowError = true;
          update();
          print(resData.data);
          Alertbox().alertMessage('Might be some issue while Login');
        }
        isLoading = false;
      } catch (e) {
        isLoading = false;
        isShowError = true;
        update();
        print(e);
      }
    } else {
      isLoading = false;
      isShowError = true;
      update();
    }
  }
}
