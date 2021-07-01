import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Services/AuthServices/AuthStatusInLocalDataService.dart';
import 'package:infinity_basket_app_dev/Services/AuthServices/SignInService.dart';
import 'package:infinity_basket_app_dev/Services/SharedPreferenceService/SharedPreferencesService.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ImageConstants.dart';

class UserAccountUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 200),
        Image.asset(ImageConstants.devIcon, height: 150),
        SizedBox(
          height: 200,
          child: Center(
            child: Container(
              width: size.width * 0.35,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: ColorConstants.secondaryColor,
                onPressed: () async {
                  await AuthInLocalDataService().clearLoginData(context);
                },
                child: Text(
                  "SIGN OUT",
                  style: TextStyle(color: ColorConstants.primaryColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
