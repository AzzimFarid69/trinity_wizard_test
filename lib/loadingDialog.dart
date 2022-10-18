import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  final BuildContext context;

  LoadingDialog(this.context);

  void showLoading() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 130),
        contentPadding: EdgeInsets.only(top: 10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0))),
        content: Builder(
          builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;
            return Container(
              height: 100,
              width: width - 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Cupertino activity indicator with custom radius and disabled animation.
                  CupertinoActivityIndicator(
                    radius: 20.0,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Loading',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void hideDialog() {
    Navigator.pop(context);
  }
}
