import 'package:flutter/cupertino.dart';
import 'package:infinity_basket_app_dev/Components/SnackBar/showSnackBar.dart';
import 'package:infinity_basket_app_dev/Models/SignInModel/SignInResponseModel.dart';
import 'package:infinity_basket_app_dev/Models/SignInModel/SingInRequestModel.dart';
import 'package:infinity_basket_app_dev/Providers/SignInProvider/SignInProvider.dart';
import 'package:infinity_basket_app_dev/Services/API/api.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:infinity_basket_app_dev/Services/AuthServices/AuthStatusService.dart';
import 'package:provider/provider.dart';

class SignInService {
  Future<ApiResponse<SignInResponseModel>> loginUser(
      String phoneNo, String password, BuildContext context) async {
    try {
      Provider.of<SignInProvider>(context, listen: false).setLoading(true);
      SignInRequestModel _signInRequest = SignInRequestModel(
        user: User(
          phone: phoneNo,
          password: password,
        ),
      );
      var response =
          await Api.httpPostRequest("auth/login", _signInRequest.toJson());
      SignInResponseModel _responseModel =
          SignInResponseModel.fromJson(response);
      if (_responseModel.status == 200) {
        AuthService().setAuthToken(_responseModel.data.accessToken, context);
      }
      Provider.of<SignInProvider>(context, listen: false).setLoading(false);
      return ApiResponse.completed(_responseModel);
    } catch (e) {
      Provider.of<SignInProvider>(context, listen: false).setLoading(false);
      showSnackBar('Error', context);
      return ApiResponse.error(e);
    }
  }
}
