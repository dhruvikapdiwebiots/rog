
import 'package:rog/packages/config_package.dart';
import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  final Widget? child;

  LoadingComponent({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //GestureDetector is for unFocus text controller when click on screen
    return /*Container(
      color: Colors.white.withOpacity(0.6),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Material(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    appColor.primaryColor),
                strokeWidth: 3,
              ),
            ),
          ),
        ),
      ),
    );*/
      Container(
        color: Colors.white.withOpacity(0.6),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Material(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(60))),
            child: Padding(
              padding: EdgeInsets.all(AppScreenUtil().size(8)),
              child: SizedBox(
                height: AppScreenUtil().size(20),
                width: AppScreenUtil().size(20),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      appColor.primaryColor),
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
        ),
      );
  }
}
