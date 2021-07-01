import 'package:flutter/cupertino.dart';
import 'package:infinity_basket_app_dev/Components/SnackBar/showSnackBar.dart';
import 'package:infinity_basket_app_dev/Models/OtpPasswordModel/OtpPasswordRequestModel.dart';
import 'package:infinity_basket_app_dev/Models/OtpPasswordModel/OtpPasswordResponseModel.dart';
import 'package:infinity_basket_app_dev/Providers/OtpPasswordProvider/OtpPasswordProvider.dart';
import 'package:infinity_basket_app_dev/Services/API/api.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:provider/provider.dart';

class OtpPasswordService {
  Future<ApiResponse<OtpPasswordResponseModel>> getPasswordRecoveryOtp(
      String phoneNo, BuildContext context) async {
    var otpProvider = Provider.of<OtpPasswordProvider>(context, listen: false);
    try {
      otpProvider.setLoading(true);
      OtpPasswordRequestModel _optPasswordRequest =
          OtpPasswordRequestModel(verify: Verify(phone: phoneNo));
      var response = await Api.httpPostRequest(
          "auth/send_password_otp", _optPasswordRequest.toJson());
      OtpPasswordResponseModel _responseModel =
          OtpPasswordResponseModel.fromJson(response);
      otpProvider.setOtpResponse = _responseModel;
      otpProvider.setLoading(false);
      return ApiResponse.completed(_responseModel);
    } catch (e) {
      otpProvider.setLoading(false);
      otpProvider.setOtpResponse = null;
      showSnackBar("Unable to Get Otp", context);
      return ApiResponse.error(e);
    }
  }
}
