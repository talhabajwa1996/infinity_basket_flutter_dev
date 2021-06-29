import 'package:flutter/cupertino.dart';
import 'package:infinity_basket_app_dev/Models/SignInModel/SignInResponseModel.dart';
import 'package:infinity_basket_app_dev/Providers/SignInProvider/SignInProvider.dart';
import 'package:infinity_basket_app_dev/Services/SharedPreferenceService/SharedPreferencesService.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/SharedPrefsConstant.dart';
import 'package:provider/provider.dart';

class AuthInLocalDataService {
  Future<void> getSignInValues(BuildContext context) async {
    SignInResponseModel _signInResponseFromSharedPrefs = SignInResponseModel(
      data: Data(
        email: await SharedPreferencesService()
            .getString(SharedPrefsConstant.email),
        accessToken: await SharedPreferencesService()
            .getString(SharedPrefsConstant.accessToken),
        createdAt: await SharedPreferencesService()
            .getString(SharedPrefsConstant.createdAt),
        firstName: await SharedPreferencesService()
            .getString(SharedPrefsConstant.firstName),
        id: await SharedPreferencesService().getInt(SharedPrefsConstant.id),
        isVerified: await SharedPreferencesService()
            .getBool(SharedPrefsConstant.isVerified),
        lastName: await SharedPreferencesService()
            .getString(SharedPrefsConstant.lastName),
        phone: await SharedPreferencesService()
            .getString(SharedPrefsConstant.phone),
        role: await SharedPreferencesService()
            .getString(SharedPrefsConstant.role),
        updatedAt: await SharedPreferencesService()
            .getString(SharedPrefsConstant.updatedAt),
      ),
      message: await SharedPreferencesService()
          .getString(SharedPrefsConstant.message),
    );
    await SharedPreferencesService()
        .getString(SharedPrefsConstant.accessToken)
        .then((value) {
      print(value);
      if (value != null) {
        Provider.of<SignInProvider>(context, listen: false).setSignInResponse =
            _signInResponseFromSharedPrefs;
      }
    });
  }

  Future<void> setLoginData(
      SignInResponseModel signInResponseModel, BuildContext context) async {
    await SharedPreferencesService()
        .setInt(SharedPrefsConstant.id, signInResponseModel.data.id);
    await SharedPreferencesService().setString(
        SharedPrefsConstant.firstName, signInResponseModel.data.firstName);
    await SharedPreferencesService().setString(
        SharedPrefsConstant.lastName, signInResponseModel.data.lastName);
    await SharedPreferencesService()
        .setString(SharedPrefsConstant.email, signInResponseModel.data.email);
    await SharedPreferencesService()
        .setString(SharedPrefsConstant.phone, signInResponseModel.data.phone);
    await SharedPreferencesService()
        .setString(SharedPrefsConstant.role, signInResponseModel.data.role);
    await SharedPreferencesService().setString(
        SharedPrefsConstant.createdAt, signInResponseModel.data.createdAt);
    await SharedPreferencesService().setString(
        SharedPrefsConstant.updatedAt, signInResponseModel.data.updatedAt);
    await SharedPreferencesService().setString(
        SharedPrefsConstant.accessToken, signInResponseModel.data.accessToken);
    await SharedPreferencesService()
        .setString(SharedPrefsConstant.message, signInResponseModel.message);
    await SharedPreferencesService()
        .setInt(SharedPrefsConstant.status, signInResponseModel.status);
    await SharedPreferencesService().setBool(
        SharedPrefsConstant.status, signInResponseModel.data.isVerified);
    Provider.of<SignInProvider>(context, listen: false).setSignInResponse =
        signInResponseModel;
  }

  Future<void> clearLoginData(BuildContext context) async {
    await SharedPreferencesService().clearLocalData();
    Provider.of<SignInProvider>(context, listen: false).setSignInResponse =
        null;
  }
}
