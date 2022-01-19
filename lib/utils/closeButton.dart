import 'package:flutter/material.dart';
import 'package:rog/packages/config_package.dart';

class CloseButtonLayout extends StatefulWidget {
  VoidCallback? onPressed;
  CloseButtonLayout({Key? key,this.onPressed}) : super(key: key);

  @override
  _CloseButtonLayoutState createState() => _CloseButtonLayoutState();
}

class _CloseButtonLayoutState extends State<CloseButtonLayout> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      //width: MediaQuery.of(context).size.width,
      right: 10,
      child: IconButton(
        color: appColor.whiteColor,
        onPressed: widget.onPressed,
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
