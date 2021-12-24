import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rog/theme/app_font.dart';

class PrivacyAndLicence extends StatefulWidget {
  GestureTapCallback? licenceonTap;
  GestureTapCallback? privacyonTap;
   PrivacyAndLicence({Key? key,this.licenceonTap,this.privacyonTap}) : super(key: key);

  @override
  _PrivacyAndLicenceState createState() => _PrivacyAndLicenceState();
}

class _PrivacyAndLicenceState extends State<PrivacyAndLicence> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'By proceeding, you are agree to our ',
              style: TextStyle(color: Colors.black54),
            ),
            TextSpan(
              text: AppFont().licenceAgreement,
              style: TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap =widget.licenceonTap,
            ),
            TextSpan(
              text: ' and ',
              style: TextStyle(color: Colors.black54),
            ),
            TextSpan(
              text: AppFont().privacyStatment,
              style: TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = widget.privacyonTap,
            ),
          ],
        ),
      ),
    );
  }
}
