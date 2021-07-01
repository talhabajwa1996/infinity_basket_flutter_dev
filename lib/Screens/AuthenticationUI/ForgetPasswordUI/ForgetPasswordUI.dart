import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/GifLoader.dart';
import 'package:infinity_basket_app_dev/Components/SnackBar/showSnackBar.dart';
import 'package:infinity_basket_app_dev/Components/TextFields/CustomTextFormField.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/AppImageLogo/AppImageLogo.dart';
import 'package:infinity_basket_app_dev/Models/OtpPasswordModel/OtpPasswordResponseModel.dart';
import 'package:infinity_basket_app_dev/Providers/ForgetPassowrdProvider/ForgetPasswordProvider.dart';
import 'package:infinity_basket_app_dev/Providers/OtpPasswordProvider/OtpPasswordProvider.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:infinity_basket_app_dev/Services/AuthServices/OtpPasswordService.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/RouteConstants.dart';
import 'package:provider/provider.dart';
import '../../../Utils/Globals.dart' as globals;

class ForgetPasswordUI extends StatefulWidget {
  @override
  _ForgetPasswordUIState createState() => _ForgetPasswordUIState();
}

class _ForgetPasswordUIState extends State<ForgetPasswordUI> {
  var formKey = new GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _mobileNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.secondaryColor,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.1),
              Text('Forgot Password',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: size.height * 0.003),
              appImageLogo(size.height * 0.18, size.width * 0.4),
              SizedBox(height: size.height * 0.02),
              Text(
                "Recover your Account",
                style: TextStyle(color: ColorConstants.white, fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.height * 0.06,
                    vertical: size.height * 0.03),
                child: Consumer2<ForgotPasswordProvider, OtpPasswordProvider>(
                    builder:
                        (context, forgotPassword, otpPasswordProvider, child) {
                  return Form(
                    key: formKey,
                    autovalidate: forgotPassword.getIsValidated(),
                    child: Column(
                      children: <Widget>[
                        CustomTextFormField(
                          txt: 'Mobile Number',
                          prefixWidget: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SizedBox(width: 15.0),
                              Icon(Icons.phone),
                              SizedBox(width: 10.0),
                              Text(globals.countryCode),
                              SizedBox(width: 10.0),
                            ],
                          ),
                          controller: _mobileNumber,
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                          validator: (String value) =>
                              value.isEmpty || value.length != 10
                                  ? "Please enter a valid Phone No"
                                  : null,
                        ),
                        SizedBox(height: size.height * 0.01),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 1.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              forgotPassword.getError()
                                  ? forgotPassword.getMessage()
                                  : "",
                              style: TextStyle(
                                  color: ColorConstants.red, fontSize: 13),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        otpPasswordProvider.loading
                            ? Center(
                                child: GifLoader(),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * 0.42,
                                child: RaisedButton(
                                  padding: EdgeInsets.all(12.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  color: ColorConstants.white,
                                  onPressed: () async {
                                    if (formKey.currentState.validate()) {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      ApiResponse<OtpPasswordResponseModel>
                                          otpResponse =
                                          await OtpPasswordService()
                                              .getPasswordRecoveryOtp(
                                                  "${globals.countryCode}${_mobileNumber.text}",
                                                  context);
                                      if (otpResponse.status ==
                                              Status.COMPLETED &&
                                          otpResponse.responseData.status ==
                                              200) {
                                        Navigator.pushNamed(context,
                                            RouteConstants.otpRecoverPassword,
                                            arguments:
                                                "${globals.countryCode}${_mobileNumber.text}");
                                      } else {
                                        showSnackBar(
                                            otpResponse.responseData.message,
                                            context);
                                      }
                                    } else {
                                      forgotPassword.setIsValidated(true);
                                    }
                                  },
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        color: ColorConstants.primaryColor),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
