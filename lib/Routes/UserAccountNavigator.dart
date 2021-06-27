import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Screens/UserAccountUI/UserAccountUI.dart';
import 'package:infinity_basket_app_dev/Utils/RouteConstants.dart';

class UserAccountNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> userAccountNavigatorKey;

  UserAccountNavigator(this.userAccountNavigatorKey);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: userAccountNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case RouteConstants.initialRouteName:
                  return UserAccountUI();
                default:
                  return _errorRoute();
              }
            });
      },
    );
  }

  Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}
