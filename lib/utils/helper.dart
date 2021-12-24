import 'dart:convert';
import 'dart:io';
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

}
