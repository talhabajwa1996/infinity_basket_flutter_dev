import 'package:flutter/cupertino.dart';

class BottomBarNavigation {
  Future<dynamic> navigateTo(String routeName, BuildContext context,{Object arguments}) {
    return Navigator.of(context).pushNamed(routeName,arguments: arguments);
  }
  goBack(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
