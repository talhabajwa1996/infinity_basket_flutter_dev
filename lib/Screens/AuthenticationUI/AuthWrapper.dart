import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/GifLoader.dart';
import 'package:infinity_basket_app_dev/Providers/LocalDataProvider/LocalDataProvider.dart';
import 'package:infinity_basket_app_dev/Screens/AuthenticationUI/SignInScreen.dart';
import 'package:infinity_basket_app_dev/Screens/BottomBarUI/BottomBarUI.dart';
import 'package:infinity_basket_app_dev/Services/AuthServices/AuthStatusService.dart';
import 'package:infinity_basket_app_dev/Services/SharedPreferenceService/SharedPreferencesService.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
      stream: AuthService().getAuthStatus(context).asStream(),
      builder: (context, snapshot) {
        return snapshot.connectionState != ConnectionState.waiting
            ? Decider()
            : Center(child: GifLoader());
      },
    );
  }
}

class Decider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocalDataProvider>(
        builder: (context, localDataProvider, child) {
      return localDataProvider.authToken != null
          ? BottomBarUI()
          : SignInScreenUI();
    });
  }
}
