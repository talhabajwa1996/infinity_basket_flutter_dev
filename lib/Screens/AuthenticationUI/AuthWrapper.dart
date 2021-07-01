import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/GifLoader.dart';
import 'package:infinity_basket_app_dev/Providers/SignInProvider/SignInProvider.dart';
import 'package:infinity_basket_app_dev/Screens/AuthenticationUI/SignInScreen.dart';
import 'package:infinity_basket_app_dev/Screens/BottomBarUI/BottomBarUI.dart';
import 'package:infinity_basket_app_dev/Services/AuthServices/AuthStatusInLocalDataService.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
      stream: AuthInLocalDataService().getSignInValues(context).asStream(),
      builder: (context, snapshot) {
        return snapshot.connectionState != ConnectionState.waiting
            ? Decider()
            : Material(
          color: ColorConstants.secondaryColor,
                child: Center(child: GifLoader()),
              );
      },
    );
  }
}

class Decider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(
        builder: (context, localDataProvider, child) {
      return localDataProvider.signInResponse != null
          ? BottomBarUI()
          : SignInScreenUI();
    });
  }
}
