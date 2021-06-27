import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/GifLoader.dart';
import 'package:infinity_basket_app_dev/Screens/AuthenticationUI/SignInScreen.dart';
import 'package:infinity_basket_app_dev/Screens/BottomBarUI/BottomBarUI.dart';
import 'package:infinity_basket_app_dev/Services/SharedPreferenceService/SharedPreferencesService.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: SharedPreferencesService().getString('access-token').asStream(),
      builder: (context, snapshot) {
        return snapshot.connectionState != ConnectionState.waiting
            ? snapshot.data != null
                ? BottomBarUI()
                : SignInScreenUI()
            : Center(child: GifLoader());
      },
    );
  }
}
