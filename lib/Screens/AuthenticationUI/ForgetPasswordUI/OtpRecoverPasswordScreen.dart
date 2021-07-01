import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/GifLoader.dart';
import 'package:infinity_basket_app_dev/Components/SnackBar/showSnackBar.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/AppImageLogo/AppImageLogo.dart';
import 'package:infinity_basket_app_dev/Models/OtpPasswordModel/OtpPasswordResponseModel.dart';
import 'package:infinity_basket_app_dev/Providers/OtpPasswordProvider/OtpPasswordProvider.dart';
import 'package:infinity_basket_app_dev/Providers/OtpRegisterProvider/OtpRegisterProvider.dart';
import 'package:infinity_basket_app_dev/Providers/SignInProvider/SignInProvider.dart';
import 'package:infinity_basket_app_dev/Routes/AppNavigation.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:infinity_basket_app_dev/Services/AuthServices/OtpPasswordService.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/RouteConstants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../Utils/Globals.dart' as globals;

class OtpRecoverPasswordScreenUI extends StatefulWidget {
  final String phoneNo;

  OtpRecoverPasswordScreenUI({this.phoneNo});

  @override
  _OtpRecoverPasswordScreenUIState createState() =>
      _OtpRecoverPasswordScreenUIState();
}

class _OtpRecoverPasswordScreenUIState
    extends State<OtpRecoverPasswordScreenUI> {
  TextEditingController _otpController = new TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  String userData;

  @override
  void initState() {
    Provider.of<OtpRegisterProvider>(context, listen: false).startTimer();
    super.initState();
  }

  @override
  void dispose() {
    errorController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorConstants.secondaryColor,
        body: SingleChildScrollView(
          child:
              Consumer<OtpPasswordProvider>(builder: (context, otpData, child) {
            return Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: size.height * 0.07),
                      Text('Verification',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: ColorConstants.primaryColor,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: size.height * 0.05),
                      appImageLogo(size.height * 0.14, size.width * 0.5),
                      SizedBox(height: size.height * 0.05),
                      Text(
                        "We have sent an OTP to verify your account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorConstants.white,
                            fontSize: 18.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.phoneNo,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorConstants.primaryColor,
                                fontSize: 15.0),
                          ),
                          SizedBox(width: 5.0),
                          Material(
                              type: MaterialType.transparency,
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: ColorConstants.primaryColor
                                      .withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    AppNavigation().goBack();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.edit,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      Form(
                        child: Column(
                          children: <Widget>[
                            Consumer<OtpRegisterProvider>(
                                builder: (context, otpProvider, child) {
                              return PinCodeTextField(
                                length: 6,
                                obscureText: false,
                                controller: _otpController,
                                backgroundColor: Colors.grey.withOpacity(0.0),
                                pinTheme: PinTheme(
                                    fieldOuterPadding: EdgeInsets.all(0),
                                    shape: PinCodeFieldShape.box,
                                    inactiveColor: ColorConstants.white,
                                    activeFillColor: ColorConstants.white,
                                    inactiveFillColor: ColorConstants.white,
                                    selectedFillColor: ColorConstants.white,
                                    disabledColor: ColorConstants.white,
                                    selectedColor: ColorConstants.white,
                                    activeColor: ColorConstants.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    fieldWidth: 50,
                                    fieldHeight: 65),
                                onCompleted: (value) async {
                                  Navigator.pushReplacementNamed(context,
                                      RouteConstants.createNewPassword);
                                },
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                textStyle: TextStyle(
                                    color: ColorConstants.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                                animationType: AnimationType.fade,
                                keyboardType: TextInputType.number,
                                animationDuration: Duration(milliseconds: 300),
                                enableActiveFill: true,
                                onChanged: (value) {
                                  otpData.setError(false);
                                },
                                appContext: context,
                              );
                            }),
                            otpData.getError()
                                ? Text(
                                    otpData.getMessage(),
                                    style: TextStyle(
                                        color: ColorConstants.white,
                                        fontSize: 15),
                                  )
                                : Container(),
                            SizedBox(height: size.height * 0.01),
                            otpData.isVisible
                                ? FlatButton(
                                    onPressed: () async {
                                      ApiResponse<OtpPasswordResponseModel>
                                          otpResponse =
                                          await OtpPasswordService()
                                              .getPasswordRecoveryOtp(
                                                  widget.phoneNo, context);
                                      if (otpResponse.status ==
                                              Status.COMPLETED &&
                                          otpResponse.responseData.status ==
                                              200) {
                                        showSnackBar(
                                            otpResponse.responseData.message,
                                            context);
                                      } else {
                                        showSnackBar(
                                            otpResponse.responseData.message,
                                            context);
                                      }
                                    },
                                    child: Text(
                                      "Didn't receive code. RESEND",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w400,
                                          color: ColorConstants.black),
                                    ),
                                  )
                                : Text(
                                    "You Will Receive Code in ${'0:' + otpData.current.toString().padLeft(2, '0')}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        letterSpacing: 0.5,
                                        color: ColorConstants.white)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      otpData.loading ? GifLoader() : Container(),
                    ],
                  ),
                ));
          }),
        ));
  }
}
