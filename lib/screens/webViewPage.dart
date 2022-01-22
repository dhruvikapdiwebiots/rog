import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
String title = '';

  @override
  void initState() {
    title = Get.arguments;
    setState(() {

    });

    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }


  @override
  Widget build(BuildContext context) {

   //link for open license agreement and privacy statement
   final link = WebView(
     initialUrl: 'https://www.rogsecurity.com/tou-subscription/',
   );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: link,
    );

  }
}
