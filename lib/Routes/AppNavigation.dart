import 'package:flutter/material.dart';

class AppNavigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateWithDataTo(String routeName,Object arguments) {
    return navigatorKey.currentState.pushNamed(routeName,arguments: arguments);
  }

  Future<dynamic> pushReplacementTo(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  Future<dynamic> killAllRoutes() {
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil('/home', (route) => false);
  }
  goBack() {
    return navigatorKey.currentState.pop();
  }
}
