import 'package:flutter/cupertino.dart';
import 'package:infinity_basket_app_dev/Components/SnackBar/showSnackBar.dart';
import 'package:infinity_basket_app_dev/Models/SignInModel/SignInResponseModel.dart';
import 'package:infinity_basket_app_dev/Models/SignUpModel/SignUpRequestModel.dart';
import 'package:infinity_basket_app_dev/Providers/SignInProvider/SignInProvider.dart';
import 'package:infinity_basket_app_dev/Services/API/api.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:provider/provider.dart';

import 'AuthStatusInLocalDataService.dart';

class SignUpService {
  Future<ApiResponse<SignInResponseModel>> signUpUser(
      SignUpRequestModel signUpRequest, BuildContext context) async {
    try {
      Provider.of<SignInProvider>(context, listen: false).setLoading(true);
      var response =
          await Api.httpPostRequest("auth/register", signUpRequest.toJson());
      SignInResponseModel _responseModel =
          SignInResponseModel.fromJson(response);
      if (_responseModel.status == 200) {
        await AuthInLocalDataService().setLoginData(_responseModel, context);
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
