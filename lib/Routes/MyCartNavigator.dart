import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ImageConstants.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/RouteConstants.dart';

class MyCartNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> myCartNavigatorKey;

  MyCartNavigator(this.myCartNavigatorKey);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: myCartNavigatorKey,
      initialRoute: RouteConstants.initialRouteName,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case RouteConstants.initialRouteName:
                  return Container(
                    child: Center(child: Image.asset(ImageConstants.devIcon, height: 150)),
                  );
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
