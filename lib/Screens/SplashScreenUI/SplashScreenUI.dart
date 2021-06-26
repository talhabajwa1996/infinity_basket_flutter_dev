import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Routes/AppNavigation.dart';
import 'package:infinity_basket_app_dev/Utils/ColorConstants.dart';
import 'package:infinity_basket_app_dev/Utils/ImageConstants.dart';
import 'package:infinity_basket_app_dev/Utils/RouteConstants.dart';

class SplashScreenUI extends StatefulWidget {
  @override
  _SplashScreenUIState createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI>
    with SingleTickerProviderStateMixin {
  bool disableNavigation = false;
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  void navigatorPage() {
    if (!disableNavigation)
      AppNavigation().pushReplacementTo(RouteConstants.authWrapper);
  }

  startTime() async {
    return Timer(Duration(seconds: 4), navigatorPage);
  }

  @override
  void initState() {
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.splashScreenBackgroundColor,
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0, -0.15),
              child: Container(
                height: _iconAnimation.value * size.height * 0.25,
                child: Center(
                  child: Image.asset(
                    ImageConstants.appIcon,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.57),
              child: ButtonTheme(
                minWidth: size.width * 0.35,
                height: size.height * 0.057,
                child: RaisedButton(
                  elevation: 5,
                  color: ColorConstants.splashScreenGetStartedButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    setState(() {
                      disableNavigation = true;
                      _iconAnimationController.dispose();
                    });
                    AppNavigation()
                        .pushReplacementTo(RouteConstants.authWrapper);
                  },
                  child: Container(
                    width: 130,
                    height: 40,
                    child: Center(
                      child: Text(
                        'Getting Started',
                        style: TextStyle(
                            color: ColorConstants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "SF Pro Rounded",
                            fontSize: 100 * 0.165),
                        strutStyle: StrutStyle(
                          forceStrutHeight: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
