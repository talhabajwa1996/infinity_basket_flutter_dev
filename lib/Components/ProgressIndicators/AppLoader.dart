import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AppLoader extends StatelessWidget {
  final double value;
  final double strokeWidth;
  final Animation<Color> valueColor;

  AppLoader({this.strokeWidth, this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? CircularProgressIndicator(
        value: value,
        strokeWidth: strokeWidth ?? 2.0,
        valueColor: valueColor)
        : CupertinoActivityIndicator(
      radius: 12.0,
      animating: true,
    );
  }
}
