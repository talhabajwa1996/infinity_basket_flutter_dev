import 'package:flutter/cupertino.dart';
import 'package:infinity_basket_app_dev/Components/SnackBar/showSnackBar.dart';
import 'package:infinity_basket_app_dev/Models/NewPasswordModel/NewPasswordRequestModel.dart';
import 'package:infinity_basket_app_dev/Models/NewPasswordModel/NewPasswordResponseModel.dart';
import 'package:infinity_basket_app_dev/Providers/ForgetPassowrdProvider/CreateNewPasswordProvider.dart';
import 'package:infinity_basket_app_dev/Services/API/api.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:provider/provider.dart';

class RecoverPasswordService {
  Future<ApiResponse<NewPasswordResponseModel>> setNewPassword(
      String phoneNo, String password, BuildContext context) async {
    var createPasswordProvider =
        Provider.of<CreatePasswordProvider>(context, listen: false);
    try {
      createPasswordProvider.setLoading(true);
      NewPasswordRequestModel _newPasswordRequest = NewPasswordRequestModel(
          forget: Forget(phone: phoneNo, password: password));
      var response = await Api.httpPostRequest(
          "auth/change_password", _newPasswordRequest.toJson());
      NewPasswordResponseModel _responseModel =
          NewPasswordResponseModel.fromJson(response);
      createPasswordProvider.setLoading(false);
      return ApiResponse.completed(_responseModel);
    } catch (e) {
      createPasswordProvider.setLoading(false);
      showSnackBar('Unable to update Password', context);
      return ApiResponse.error(e);
    }
  }
}
