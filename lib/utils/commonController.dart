import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';

class CommonController extends GetxController {
  var postUrl = "fcm.googleapis.com/fcm/send";

  Future<void> sendNotification({title, msg}) async {
    var token = await FirebaseMessaging.instance.getToken();
    print('token : $token');

    final data = {
      "notification": {"body": msg, "title": title},
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done"
      },
      "to": "$token"
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
      'key=AAAAI7QGmyE:APA91bE5B6Gfx12ZnkMtfwiEV-eDtUIN_bzNBrcHTRpnDpgZnB6R0_mwpGezI1oBHbfIN5u62_novr64Y7kSF6ix8u26-Cu1AdfGS5p4m8eNJ9u7k8ulGpx9O_OEqMQNUgPQExm89mYA'
    };

    BaseOptions options = new BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: headers,
    );

    try {
      final response = await Dio(options)
          .post('https://fcm.googleapis.com/fcm/send', data: data);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Request Sent To Driver');
      } else {
        print('notification sending failed');
        // on failure do sth
      }
    } catch (e) {
      print('exception $e');
    }
  }

  //check Token Validation
  Future<bool> checkTokenValidation() async {
    print('Calling Token api');
    try {
      var requestData = {};

      print(requestData.toString());
      var resData =
      await apis.apiCall(apiMethods.verifyToken, requestData, 'get');
      print('status :${resData.statusCode}');
      print('data :${resData.body}');
      if (resData.statusCode == 200) {
        return true;
      } else {
        print('error : ${resData.data}');
        return false;
      }
    } catch (e) {
      print('error');
      print(e);
      return false;
    }
  }
}
