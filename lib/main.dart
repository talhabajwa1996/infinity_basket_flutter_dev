import 'package:flutter/material.dart';
import 'Routes/AppNavigation.dart';
import 'Routes/Routes.dart';
import 'Utils/ColorConstants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: ColorConstants.primaryColor,
      100: ColorConstants.primaryColor,
      200: ColorConstants.primaryColor,
      300: ColorConstants.primaryColor,
      400: ColorConstants.primaryColor,
      500: ColorConstants.primaryColor,
      600: ColorConstants.primaryColor,
      700: ColorConstants.primaryColor,
      800: ColorConstants.primaryColor,
    };
    MaterialColor colorCustom = MaterialColor(0xFF0D7276, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigation.navigatorKey,
      title: 'Infinity Basket',
      theme: ThemeData(
          primaryColor: ColorConstants.primaryColor,
          primarySwatch: colorCustom,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'SF Pro Rounded'),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}