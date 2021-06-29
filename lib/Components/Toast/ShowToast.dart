import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';

showToast(String message, {Color color}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? ColorConstants.black,
      textColor: ColorConstants.white,
      fontSize: 14.0);
}
