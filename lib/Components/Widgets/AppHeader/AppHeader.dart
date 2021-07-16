import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ImageConstants.dart';

AppBar appHeader(context, {bool isNavigatorPushed = false}) {
  return AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.white,
      brightness: Brightness.light,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.appIcon,height: 50),
          Text(
            'Infinity Basket',
            style: TextStyle(
                fontSize: 20,
                color: ColorConstants.tilesText,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: isNavigatorPushed ? 50 : 0)
        ],
      ),
      iconTheme: IconThemeData(color: ColorConstants.primaryColor));
}
