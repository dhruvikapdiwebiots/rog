import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyStatement extends StatefulWidget {
  const PrivacyStatement({Key? key}) : super(key: key);

  @override
  _PrivacyStatementState createState() => _PrivacyStatementState();
}

class _PrivacyStatementState extends State<PrivacyStatement> {

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Statement'),
      ),
      body: WebView(
        initialUrl: 'https://www.rogsecurity.com/tou-subscription/',
      ),
    );
  }
}
