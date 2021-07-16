import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Screens/MarketPlaceScreenUI/MarketPlaceScreenUI.dart';
import 'package:infinity_basket_app_dev/Screens/ShopLandingScreenUI/ShopLandingScreenUI.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ImageConstants.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/RouteConstants.dart';

class MarketPlaceNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> marketNavigatorKey;

  MarketPlaceNavigator(this.marketNavigatorKey);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: marketNavigatorKey,
      initialRoute: RouteConstants.initialRouteName,
      onGenerateRoute: (RouteSettings settings) {
        var routeArgs = settings.arguments;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            switch (settings.name) {
              case RouteConstants.initialRouteName:
                return Container(
                  child: Center(child: MarketPlaceScreenUI()),
                );
              case RouteConstants.shopLandingUI:
                return Container(
                  child: Center(child: ShopLandingScreenUI(routeArgs)),
                );
              default:
                return _errorRoute();
            }
          },
        );
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
