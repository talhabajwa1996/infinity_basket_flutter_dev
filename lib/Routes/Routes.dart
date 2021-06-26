import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Screens/AuthenticationUI/AuthWrapper.dart';
import 'package:infinity_basket_app_dev/Screens/SplashScreenUI/SplashScreenUI.dart';
import 'package:infinity_basket_app_dev/Utils/RouteConstants.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteConstants.splashScreen:
        return PageTransition(
            child: SplashScreenUI(), type: PageTransitionType.rightToLeft);
      case RouteConstants.authWrapper:
        return PageTransition(
            child: AuthWrapper(), type: PageTransitionType.rightToLeft);
      // case '/signin':
      //   return PageTransition(
      //       child: SignInScreenUI(), type: PageTransitionType.rightToLeft);
      // case '/sign-up':
      //   return PageTransition(
      //       child: SignUpScreenUI(), type: PageTransitionType.rightToLeft);
      // case '/otp':
      //   return PageTransition(
      //       child: OtpScreenUI(args), type: PageTransitionType.rightToLeft);
      // case '/home':
      //   return PageTransition(
      //       child: PushNotificationsManager(child: BottomNavigationalBar()), type: PageTransitionType.rightToLeft);
      // case '/forget-password':
      //   return PageTransition(
      //       child: ForgetPasswordUI(), type: PageTransitionType.rightToLeft);
      // case '/create-password':
      //   return PageTransition(
      //       child: CreateNewPasswordUI(), type: PageTransitionType.rightToLeft);
      // case '/notifications':
      //   return PageTransition(
      //       child: NotificationsUI(), type: PageTransitionType.rightToLeft);
      // case '/order-detail':
      //   return PageTransition(
      //       child: PushNotificationsManager(child: OrderDetailScreenUI(args)),
      //       type: PageTransitionType.rightToLeft);
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
