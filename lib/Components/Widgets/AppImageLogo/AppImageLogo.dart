import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ImageConstants.dart';

Widget appImageLogo(double height, double width, {Color color}) {
  return Image.asset(
    ImageConstants.appIcon,
    height: height,
    width: width,
    color: color,
  );
}
