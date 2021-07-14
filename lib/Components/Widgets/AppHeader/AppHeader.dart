import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ImageConstants.dart';

AppBar appHeaderTabs(context) {
  return AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.white,
      brightness: Brightness.light,
      centerTitle: true,
      title: Image.asset(ImageConstants.appIcon,height: 50),
      iconTheme: IconThemeData(color: ColorConstants.primaryColor));
}
