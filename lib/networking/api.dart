import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/utils/helper.dart';

Dio dio = new Dio();

class Apis {
  Future<dynamic> apiCall(String apiName, body, type) async {
    dynamic response;
    try {
      bool isInternet = await Helper().isNetworkConnection();
      if (isInternet) {
        print('call');
        String? authToken = "";
        if (apiName == "authenticate") {
          authToken = "Authorization";
          print("authToken : $authToken");
        } else {
          authToken = await SharedPref().getSharedPref('token');
          print("authToken : $authToken");
        }
        print('apiurl : ${serverConfig.apiUrl + apiName}');

        GetHttpClient reqMethod = GetHttpClient();
        switch (type) {
          case 'get':
            response = await reqMethod.get(serverConfig.apiUrl + apiName,
                headers: {
                  'Authorization': 'Bearer $authToken',
                  'Content-type': 'application/json'
                });
            break;
          case 'post':
            response = await reqMethod.post(serverConfig.apiUrl + apiName,
                body: body,
                headers: {
                  'Authorization': 'Bearer $authToken',
                  'Content-type': 'application/json'
                });
            break;
          case 'delete':
            response = await dio.delete(apiName, data: body);
            break;
          case 'put':
            response = await dio.put(apiName, data: body);
            break;
          case 'patch':
            response = await reqMethod.patch(serverConfig.apiUrl + apiName,
                body: body,
                headers: {
                  'Authorization': 'Bearer $authToken',
                  'Content-type': 'application/json'
                });
            break;
        }

        return response;
      } else {
        //helper.goToNoInternetScreen();
        return 'No Internet';
        // print('No Internet');
      }
    } on SocketException catch (e) {
      onSocketException(e);
      return response;
    } on Exception catch (e) {
      onException(e);
      return response;
    }
  }

  onSocketException(e) {
    print("API : SocketException - ${e.toString()}"); //do not delete
    Helper().snackBar(AppFont().noInternet);
  }

  onException(e) {
    print("API : Exception - ${e.toString()}"); //do not delete
    Helper().snackBar(AppFont().wentWrong);
  }
}
