import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinity_basket_app_dev/Providers/SignInProvider/SignInProvider.dart';
import 'package:infinity_basket_app_dev/Utils/ColorConstants.dart';
import 'package:provider/provider.dart';

class SocialLoginIcons extends StatelessWidget {
  final double width;
  final double height;

  SocialLoginIcons({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<SignInProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: ColorConstants.primaryColor,
              height: height * 0.001,
              width: width * 0.25,
            ),
            SizedBox(
              width: width * 0.05,
            ),
            Text(
              'Social Login',
              style: TextStyle(
                  color: ColorConstants.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            Container(
              height: height * 0.001,
              width: width * 0.25,
              color: ColorConstants.primaryColor,
            )
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // GestureDetector(
            //   onTap: () {
            //     user.signInFaceBook(context);
            //   },
            //   child: Container(
            //     width: 40,
            //     height: 40,
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           Color(0xff1346b4),
            //           Color(0xff0cb2eb),
            //         ],
            //       ),
            //       shape: BoxShape.circle,
            //     ),
            //     child: Center(
            //       child: Icon(
            //         FontAwesomeIcons.facebookF,
            //         color: Colors.white,
            //         size: 20,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: 10,
            // ),
            GestureDetector(
              onTap: () {
                // user.signInGoogle(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffff4645),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   width: 10,
            // ),
            // Platform.isIOS?GestureDetector(
            //   onTap: () {
            //   },
            //   child: Container(
            //     width: 40,
            //     height: 40,
            //     decoration: BoxDecoration(
            //       color: Colors.black,
            //       shape: BoxShape.circle,
            //     ),
            //     child: Center(
            //       child: Icon(
            //         FontAwesomeIcons.apple,
            //         color: Colors.white,
            //         size: 25,
            //       ),
            //     ),
            //   ),
            // ):Container(),
          ],
        ),
        SizedBox(
          height: height * 0.03,
        ),
      ],
    );
  }
}
