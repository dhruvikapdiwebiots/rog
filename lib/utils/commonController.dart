import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/utils/helper.dart';

class CommonController extends GetxController {
  var postUrl = "fcm.googleapis.com/fcm/send";
  String alertCount = '0';
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //send push notification tu User
  Future<void> sendNotification({title, msg}) async {
    var token = await FirebaseMessaging.instance.getToken();
    print('token : $token');

    final data = {
      "notification": {
        "body": msg,
        "title": title,
      },
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "alertMessage": 'true'
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
        print('Alert push notification send');
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

//check whether user is exists or not and save fcmtoken
  setFirebase() async {
    var token = await FirebaseMessaging.instance.getToken();
    print('loginToken : $token');
    dynamic userData = await Helper().getStorage('userData');
    print('userData : $userData');
    String uuid = userData['uuid'];
    print('uu : $uuid');
    Map<String, dynamic> data = <String, dynamic>{
      "fcmToken": token,
    };
    DocumentReference documentReferencer =
        uuid == "" ? users.doc() : users.doc(uuid);

    DocumentSnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uuid).get();
    if (querySnapshot.exists) {
      await documentReferencer
          .update(data)
          .whenComplete(() => print('Update Done'))
          .catchError((e) => print(e));
    } else {
      print('errt');
      await documentReferencer
          .set(data)
          .whenComplete(() => print('Done'))
          .catchError((e) => print(e));
    }
  }

  //get new alert count
  getNewAlertCount() async {
    try {
      bool isToken = await CommonController().checkTokenValidation();
      if (isToken) {
        print('get New Alert Count api calling');
        List requestData = [];
        var userData = await Helper().getStorage('userData');

        print(requestData.toString());
        var resData = await apis.apiCall(
            'users/${userData['uuid']}/alerts-count/', requestData, 'get');
        print('status :${resData.statusCode}');
        if (resData.statusCode == 200) {
          print('count : ${resData.body['Count']}');
          if (resData.body['Count'] != 0) {
            alertCount = resData.body['Count'].toString();
            await Helper().writeStorage(
                'alertCount', resData.body['Count'].toString());
            update();
            getNewAlert();
          } else {
            alertCount = '0';
            await Helper().writeStorage('alertCount', '0');
            update();
          }
        } else {
          print('Error while getting userData');
        }
      }else{
        Get.offAllNamed(routeName.loginScreen);
      }
    } catch (e) {
      update();
      print(e);
    }
  }

  //get new alert count
  getNewAlert() async {
    try {
      List requestData = [];
      var userData = await Helper().getStorage('userData');
      if (userData != null && userData != "") {
        print(requestData.toString());
        var resData = await apis.apiCall(
            'users/${userData['uuid']}/alerts-new/', requestData, 'get');
        print('status :${resData.statusCode}');
        if (resData.statusCode == 200) {
          var data = resData.body;
          if (data.length > 0 && data != null) {
            if (data[0]['new_alerts'] != 0)
              sendNotification(
                  title: 'New Alert Added',
                  msg: 'New Alert added in the ' +
                      data[0]['cameras_name'] +
                      ' Camera');

          }
        } else {
          print('Error while getting userData');
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
