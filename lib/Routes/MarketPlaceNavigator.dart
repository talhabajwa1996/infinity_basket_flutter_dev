import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Utils/ImageConstants.dart';
import 'package:infinity_basket_app_dev/Utils/RouteConstants.dart';

class MarketPlaceNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> marketNavigatorKey;

  MarketPlaceNavigator(this.marketNavigatorKey);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: marketNavigatorKey,
      initialRoute: RouteConstants.initialRouteName,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
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
