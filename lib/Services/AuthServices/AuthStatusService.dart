import 'package:flutter/cupertino.dart';
import 'package:infinity_basket_app_dev/Providers/LocalDataProvider/LocalDataProvider.dart';
import 'package:infinity_basket_app_dev/Services/SharedPreferenceService/SharedPreferencesService.dart';
import 'package:provider/provider.dart';

class AuthService {
  Future<void> getAuthStatus(BuildContext context) async {
    await SharedPreferencesService().getString('access-token').then((value) {
      if (value != null) {
        Provider.of<LocalDataProvider>(context, listen: false).setAuthToken =
            value;
      }
    });
  }

  setAuthToken(String authToken, BuildContext context) {
    SharedPreferencesService().setString('access-token', authToken);
    Provider.of<LocalDataProvider>(context, listen: false).setAuthToken =
        authToken;
  }

  clearAuthToken(BuildContext context) async {
    await SharedPreferencesService().deletePrefs('access-token');
    Provider.of<LocalDataProvider>(context, listen: false).setAuthToken = null;
  }
}
