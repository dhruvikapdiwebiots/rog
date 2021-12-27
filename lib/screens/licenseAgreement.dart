import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LicenseAgreement extends StatefulWidget {
  const LicenseAgreement({Key? key}) : super(key: key);

  @override
  _LicenseAgreementState createState() => _LicenseAgreementState();
}

class _LicenseAgreementState extends State<LicenseAgreement> {


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
        title: Text('License Agreement'),
      ),
      body: WebView(
        initialUrl: 'https://www.rogsecurity.com/tou-subscription/',
      ),
    );
  }
}
