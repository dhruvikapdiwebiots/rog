import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rog/utils/loading_controller.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final _storage = GetStorage();
var loadingCtrl = Get.find<LoadingController>();

class Helper {
  Future<bool> isNetworkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      final result = await InternetAddress.lookup('google.com'); //Check For Internet Connection
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        return true;
      else
        return false;
    }
  }
  //Loader
  showLoading() => loadingCtrl.showLoading();

  hideLoading() => loadingCtrl.hideLoading();

  //ur launcher
  launchURL(url) async {
    print('url : $url');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  //#region Snackbar
  snackBar(message, {context, duration}) {
    final snackBar = SnackBar(
      content: Text(
        message,
       // style: appCss.h5.copyWith(color: Colors.white),
      ),
      duration: Duration(
        milliseconds: duration == 'short' ? 1000 : (duration == 'long' ? 4000 : 2000),
      ),
    );

    ScaffoldMessenger.of(context ?? Get.context).clearSnackBars();
    ScaffoldMessenger.of(context ?? Get.context).showSnackBar(snackBar);

    //ex : helper.snackBar('alert message');
  }

  //store data
  Future<dynamic> writeStorage(String key, dynamic value) async {
    dynamic object = value != null ? json.encode(value) : value;
    return await _storage.write(key, object);

    //ex : await helper.writeStorage(session.id, data['id']);
  }

  //get storage data
  dynamic getStorage(String name)async {
    dynamic info = await _storage.read(name) ?? '';
    print("info : ${info}");
    return info != '' ? json.decode(info) : info;

    //ex : helper.getStorage('authToken');
  }
}
