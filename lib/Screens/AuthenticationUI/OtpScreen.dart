import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/GifLoader.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/AppImageLogo/AppImageLogo.dart';
import 'package:infinity_basket_app_dev/Providers/OtpProvider/OtpProvider.dart';
import 'package:infinity_basket_app_dev/Routes/AppNavigation.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpScreenUI extends StatefulWidget {
  // final Map<String, String> routeArgs;
  // OtpScreenUI(this.routeArgs);

  @override
  _OtpScreenUIState createState() => _OtpScreenUIState();
}

class _OtpScreenUIState extends State<OtpScreenUI> {
  TextEditingController _otpController = new TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  String userData;

  @override
  void initState() {
    Provider.of<OtpProvider>(context, listen: false).startTimer();
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
          child: Consumer<OtpProvider>(builder: (context, otpData, child) {
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
                            "03314978350",
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
                                  color: ColorConstants.primaryColor.withOpacity(0.7),
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
                            PinCodeTextField(
                              length: 4,
                              obscureText: false,
                              controller: _otpController,
                              backgroundColor: Colors.grey.withOpacity(0.0),
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  inactiveColor: ColorConstants.white,
                                  activeFillColor: ColorConstants.white,
                                  inactiveFillColor: ColorConstants.white,
                                  selectedFillColor: ColorConstants.white,
                                  disabledColor: ColorConstants.white,
                                  selectedColor: ColorConstants.white,
                                  activeColor: ColorConstants.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  fieldWidth: 60,
                                  fieldHeight: 60),
                              onCompleted: (value) {
                                ///register service here
                              },
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            ),
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
                                    onPressed: () {},
                                    child: Text(
                                      "Don't receive code. RESEND",
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
                      otpData.isLoading() ? GifLoader() : Container(),
                    ],
                  ),
                ));
          }),
        ));
  }
}
