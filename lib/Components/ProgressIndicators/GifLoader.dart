import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GifLoader extends StatelessWidget {
  final double value;
  final double strokeWidth;
  final Animation<Color> valueColor;

  GifLoader({this.strokeWidth, this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/loader.gif",
      width: strokeWidth != null?30:46,
      height: strokeWidth != null?30:46,
      gaplessPlayback: true,

      fit: BoxFit.contain,
    );
  }
}
