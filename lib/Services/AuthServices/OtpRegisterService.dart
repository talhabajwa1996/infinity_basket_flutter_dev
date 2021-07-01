import 'package:flutter/cupertino.dart';
import 'package:infinity_basket_app_dev/Components/SnackBar/showSnackBar.dart';
import 'package:infinity_basket_app_dev/Models/OtpRegisterModel/OtpRegisterRequestModel.dart';
import 'package:infinity_basket_app_dev/Models/OtpRegisterModel/OtpResponseModel.dart';
import 'package:infinity_basket_app_dev/Providers/OtpRegisterProvider/OtpRegisterProvider.dart';
import 'package:infinity_basket_app_dev/Services/API/api.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:provider/provider.dart';

class OtpRegisterService {
  Future<ApiResponse<OtpRegisterResponseModel>> getRegisterOtp(
      String email, String phone, BuildContext context) async {
    var otpProvider = Provider.of<OtpRegisterProvider>(context, listen: false);
    try {
      otpProvider.setLoading(true);
      OtpRegisterRequestModel _otpRequest =
          OtpRegisterRequestModel(verify: Verify(phone: phone, email: email));
      var response = await Api.httpPostRequest(
          "auth/verifyRegistrationOtp", _otpRequest.toJson());
      OtpRegisterResponseModel _responseModel =
          OtpRegisterResponseModel.fromJson(response);
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
