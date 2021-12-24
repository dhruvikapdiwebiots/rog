/*
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
//app package
import 'package:fastwhistle/global/utility/index.dart' show helper, constValue;
import 'package:fastwhistle/models/api_data_class.dart';

import 'server_config.dart';

Dio dio = new Dio();
ServerConfig _serverConfig = ServerConfig();

class Apis {
  //this is compulsory. do not delete
  Apis() {
    //options
    dio.options
      ..baseUrl = _serverConfig.apiUrl
      ..validateStatus = (int status) {
        //this will always redirect to onResponse method
        if (status != null)
          return status > 0;
        else
          return false;
      }
      ..headers = {
        'Accept': 'application/json',
      };
    //interceptors
    */
/*dio.interceptors
      ..add(
        InterceptorsWrapper(onRequest: (options) {
          print("interceptors onRequest");
          print(options.uri);
          return options;
        }, onResponse: (response) {
          print("interceptors onResponse");
          print(response.statusCode);
          return response;
        }, onError: (error) {
          print("interceptors onError");
          print(error.toString());
        }),
      );*/ /*

  }

  Future<APIDataClass> checkStatus(response) async {
    print("statusCode : ${response.statusCode}");
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201)
      return APIDataClass(
        isSuccess: true,
        validation: false,
        message: 'Success',
        data: response.data,
      );
    else if (response.statusCode == 422)
      return APIDataClass(
        isSuccess: false,
        validation: true,
        message: 'validation failed',
        data: response.data,
      );
    else {
      helper.errorMessage('Something went wrong. Try again after some time');
      return APIDataClass(
        isSuccess: false,
        validation: false,
        message: response.statusMessage,
        data: null,
      );
    }
  }

  //to get full path with paramiters
  static Future<String> getFullUrl(String apiName, List params) async {
    String _url = "";
    if (params.length > 0) {
      _url = apiName + "?";
      for (int i = 0; i < params.length; i++) {
        _url = _url + '${params[i]["key"]}=${params[i]["value"]}';
        if (i + 1 != params.length) _url = _url + "&";
      }
    } else
      _url = apiName;

    //String url = _serverConfig.apiUrl + '$_url';

    return _url;
  }

  // ignore: missing_return
  Future<APIDataClass> getApi(String apiName, List params) async {
    //default data to class
    APIDataClass apiData = new APIDataClass(message: 'No Data', isSuccess: false, validation: false, data: null);
    try {
      print("API : start"); //do not delete
      var connectivityResult = await Connectivity().checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
      if (connectivityResult == ConnectivityResult.none) {
        print("API : ${constValue.noInternet}"); // do not delete
        helper.alertMessage(constValue.noInternet);
        return apiData;
      } else {
        final result = await InternetAddress.lookup('google.com'); //Check For Internet Connection
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print("API : internet connected"); //do not delete

          String url = await getFullUrl(apiName, params);
          print("$apiName URL: " + url);

          String authToken = helper.getStorage('authToken');
          print("authToken : $authToken");
          dio.options.headers["Authorization"] = "Bearer $authToken";

          final response = await dio.get(url); //dio request
          apiData = await checkStatus(response); // get data base on status code
          return apiData;
        }
      }
    } on SocketException catch (e) {
      print("API : SocketException - ${e.toString()}"); //do not delete
      helper.alertMessage(constValue.noInternet);
      return apiData;
    } on Exception catch (e) {
      print("API : Exception - ${e.toString()}"); //do not delete
      helper.alertMessage(constValue.wentWrong);
      return apiData;
    }
  }

  // ignore: missing_return
  Future<APIDataClass> postApi(String apiName, body) async {
    //default data to class
    APIDataClass apiData = new APIDataClass(message: 'No Data', isSuccess: false, validation: false, data: null);

    try {
      print("API : start"); //do not delete
      var connectivityResult = await Connectivity().checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
      if (connectivityResult == ConnectivityResult.none) {
        print("API : ${constValue.noInternet}"); // do not delete
        helper.alertMessage(constValue.noInternet);
        return apiData;
      } else {
        final result = await InternetAddress.lookup('google.com'); //Check For Internet Connection
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print("API : internet connected"); //do not delete

          String authToken = helper.getStorage('authToken');
          dio.options.headers["Authorization"] = "Bearer $authToken";

          final response = await dio.post(apiName, data: body); //dio request
          apiData = await checkStatus(response); // get data base on status code
          return apiData;
        }
      }
      return apiData;
    } on SocketException catch (e) {
      print("API : SocketException - ${e.toString()}"); //do not delete
      helper.alertMessage(constValue.noInternet);
      return apiData;
    } on Exception catch (e) {
      print("API : Exception - ${e.toString()}"); //do not delete
      helper.alertMessage(constValue.wentWrong);
      return apiData;
    }
  }

  // ignore: missing_return
  Future<APIDataClass> postNewApi(String apiName, body) async {
    //default data to class
    APIDataClass apiData = new APIDataClass(message: 'No Data', isSuccess: false, validation: false, data: null);

    try {
      print("API : start"); //do not delete
      var connectivityResult = await Connectivity().checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
      if (connectivityResult == ConnectivityResult.none) {
        print("API : ${constValue.noInternet}"); // do not delete
        helper.alertMessage(constValue.noInternet);
        return apiData;
      } else {
        final result = await InternetAddress.lookup('google.com'); //Check For Internet Connection
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print("API : internet connected"); //do not delete

          String authToken = helper.getStorage('authToken');
          dio.options.headers["Authorization"] = "Bearer $authToken";

          final response = await dio.post(apiName, data: body); //dio request
          apiData = await checkStatus(response); // get data base on status code
          return apiData;
        }
      }
      return apiData;
    } on SocketException catch (e) {
      print("API : SocketException - ${e.toString()}"); //do not delete
      helper.alertMessage(constValue.noInternet);
      return apiData;
    } on Exception catch (e) {
      print("API : Exception - ${e.toString()}"); //do not delete
      helper.alertMessage(constValue.wentWrong);
      return apiData;
    }
  }
}
*/

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rog/models/api_data_class.dart';
import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/utils/helper.dart';

Dio dio = new Dio();

class Apis {
  //to get full path with paramiters
  static Future<String> getFullUrl(String apiName, List params) async {
    String _url = "";
    if (params.length > 0) {
      _url = apiName + "?";
      for (int i = 0; i < params.length; i++) {
        _url = _url + '${params[i]["key"]}=${params[i]["value"]}';
        if (i + 1 != params.length) _url = _url + "&";
      }
    } else
      _url = apiName;

    String url = serverConfig.apiUrl + '$_url';

    return url;
  }

  static Future<APIDataClass> getApi(String apiName, List params) async {
    //default data to class
    APIDataClass apiData = new APIDataClass(
      message: 'No Data',
      isSuccess: false,
      data: '0',
    );
    //Check For Internet
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      apiData.message = "No Internet Access";
      apiData.isSuccess = false;
      apiData.data = 0;
      return apiData;
    } else {
      String url = await getFullUrl(apiName, params);
      print("$apiName URL: " + url);

      try {
        if (apiName == "authenticate") {
        } else {
          String? authtoken = await SharedPref().getSharedPref('token');
          dio.options.headers["authtoken"] = authtoken;
        }
        //dio.options.headers["authtoken"] = authtoken;
        var response = await dio.get(
          url,
        );
        if (response.statusCode == 200) {
          //get response
          var responseData = response.data;
          print("$apiName Response: " + response.data.toString());

          //set data to class
          apiData.message = responseData["Message"];
          apiData.isSuccess = responseData["IsSuccess"];
          apiData.data = responseData["Data"];
          return apiData;
        } else {
          apiData.message = "No Internet Access";
          apiData.isSuccess = false;
          apiData.data = 0;
          return apiData;
        }
      } catch (e) {
        String message = e.toString();
        if (e.toString().contains("hostname")) message = "Server Error";
        apiData.message = message;
        apiData.isSuccess = false;
        apiData.data = 0;

        return apiData;
      }
    }
  }

  Future<dynamic> postApi(String apiName, body) async {
    final response;
    //Check For Internet
    try {
      String? authToken = "";
      if (apiName == "authenticate") {
        authToken = "Authorization";
        print("authToken : $authToken");
      } else {
        authToken = await SharedPref().getSharedPref('token');
      }

      GetHttpClient reqMethod = GetHttpClient();
      final response = await reqMethod.post(serverConfig.apiUrl + apiName,
          body: body,
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-type': 'application/json'
          });

      return response;
    } catch (e) {
      String message = e.toString();
      if (e.toString().contains("hostname")) message = "Server Error";
      print(e.toString());

      return 'response';
    }
  }

  static Future<APIDataClass> checkStatus(response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return APIDataClass(
        isSuccess: true,
        message: 'Data Get Successfully',
        data: response.body['jwt'],
      );
    } else if (response.statusCode == 401) {
      return APIDataClass(
        isSuccess: false,
        message:'Error',
        data: response.body["Data"],
      );
    } else {
      return APIDataClass(
        isSuccess: false,
        message: response.body["Message"].toString(),
        data: response.body["Data"],
      );
    }
  }
}
