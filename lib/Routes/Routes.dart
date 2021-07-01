import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Screens/AuthenticationUI/AuthWrapper.dart';
import 'package:infinity_basket_app_dev/Screens/AuthenticationUI/ForgetPasswordUI/CreateNewPasswordUI.dart';
import 'package:infinity_basket_app_dev/Screens/AuthenticationUI/ForgetPasswordUI/ForgetPasswordUI.dart';
import 'package:infinity_basket_app_dev/Screens/AuthenticationUI/ForgetPasswordUI/OtpRecoverPasswordScreen.dart';
import 'package:infinity_basket_app_dev/Screens/AuthenticationUI/OtpRegisterScreen.dart';
import 'package:infinity_basket_app_dev/Screens/AuthenticationUI/SingUpScreen.dart';
import 'package:infinity_basket_app_dev/Screens/BottomBarUI/BottomBarUI.dart';
import 'package:infinity_basket_app_dev/Screens/SplashScreenUI/SplashScreenUI.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/RouteConstants.dart';
import 'package:page_transition/page_transition.dart';
import '../Utils/Globals.dart' as globals;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final animationDuration =
        Duration(milliseconds: globals.pageTransitionDuration);
    final args = settings.arguments;
    switch (settings.name) {
      case RouteConstants.splashScreen:
        return PageTransition(
            child: SplashScreenUI(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.authWrapper:
        return PageTransition(
            child: AuthWrapper(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.signUp:
        return PageTransition(
            child: SignUpScreen(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.otpRegister:
        return PageTransition(
            child: OtpRegisterScreenUI(signUpData: args),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.bottomBarUi:
        return PageTransition(
            child: BottomBarUI(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.forgetPassword:
        return PageTransition(
            child: ForgetPasswordUI(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.otpRecoverPassword:
        return PageTransition(
            child: OtpRecoverPasswordScreenUI(phoneNo: args),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      case RouteConstants.createNewPassword:
        return PageTransition(
            child: CreateNewPasswordUI(phoneNo: args),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
