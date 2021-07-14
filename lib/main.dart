import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Providers/ForgetPassowrdProvider/CreateNewPasswordProvider.dart';
import 'package:infinity_basket_app_dev/Providers/ForgetPassowrdProvider/ForgetPasswordProvider.dart';
import 'package:infinity_basket_app_dev/Providers/MarketPlaceProvider/MarketPlaceProvider.dart';
import 'package:infinity_basket_app_dev/Providers/OtpPasswordProvider/OtpPasswordProvider.dart';
import 'package:infinity_basket_app_dev/Providers/OtpRegisterProvider/OtpRegisterProvider.dart';
import 'package:infinity_basket_app_dev/Providers/SignInProvider/SignInProvider.dart';
import 'package:provider/provider.dart';
import 'Routes/AppNavigation.dart';
import 'Routes/Routes.dart';
import 'Utils/Constants/ColorConstants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInProvider>(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider<SignInProvider>(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider<OtpRegisterProvider>(
          create: (context) => OtpRegisterProvider(),
        ),
        ChangeNotifierProvider<ForgotPasswordProvider>(
          create: (context) => ForgotPasswordProvider(),
        ),
        ChangeNotifierProvider<CreatePasswordProvider>(
          create: (context) => CreatePasswordProvider(),
        ),
        ChangeNotifierProvider<OtpPasswordProvider>(
          create: (context) => OtpPasswordProvider(),
        ),
        ChangeNotifierProvider<MarketPlaceProvider>(
          create: (context) => MarketPlaceProvider(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
