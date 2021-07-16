import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShadowText extends StatelessWidget {
  ShadowText(this.data, {this.style, this.shadowColor}) : assert(data != null);

  final String data;
  final TextStyle style;
  final Color shadowColor;

  Widget build(BuildContext context) {
    return new ClipRect(
      child: new Stack(
        children: [
          new Positioned(
            top: 2.0,
            left: 2.0,
            child: new Text(
              data,
              style: style.copyWith(color: shadowColor ?? Colors.white),
            ),
          ),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: new Text(data, style: style),
          ),
        ],
      ),
    );
  }
}
