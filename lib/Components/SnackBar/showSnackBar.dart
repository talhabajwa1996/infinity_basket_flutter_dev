import 'package:flutter/material.dart';

showSnackBar(String message, BuildContext context, {SnackBarAction action}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    action: action,
  ));
}
