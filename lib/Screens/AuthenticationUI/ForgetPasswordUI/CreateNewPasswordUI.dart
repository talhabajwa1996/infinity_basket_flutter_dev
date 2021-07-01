import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/GifLoader.dart';
import 'package:infinity_basket_app_dev/Components/TextFields/CustomTextFormField.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/AppImageLogo/AppImageLogo.dart';
import 'package:infinity_basket_app_dev/Providers/ForgetPassowrdProvider/CreateNewPasswordProvider.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';
import 'package:provider/provider.dart';

class CreateNewPasswordUI extends StatefulWidget {
  @override
  _CreateNewPasswordUIState createState() => _CreateNewPasswordUIState();
}

class _CreateNewPasswordUIState extends State<CreateNewPasswordUI> {
  var formKey = new GlobalKey<FormState>();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  FocusNode passwordNode = new FocusNode();
  FocusNode confirmPasswordNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.secondaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.1),
              Text('Create Password',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: size.height * 0.003),
              appImageLogo(size.height * 0.18, size.width * 0.4),
              SizedBox(height: size.height * 0.02),
              Text(
                "Create New Password",
                style: TextStyle(color: ColorConstants.white, fontSize: 16),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.height * 0.06),
                child: Consumer<CreatePasswordProvider>(
                    builder: (context, createPasswordProvider, child) {
                  return Form(
                    key: formKey,
                    autovalidate: createPasswordProvider.getIsValidated(),
                    child: Column(
                      children: <Widget>[
                        CustomTextFormField(
                          txt: "+923338332821",
                          readOnly: true,
                          isObscure: false,
                          isEnable: false,
                          inputAction: TextInputAction.next,
                          prefixWidget: Icon(Icons.phone),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextFormField(
                          node: passwordNode,
                          onFieldSubmit: (value) {
                            FocusScope.of(context)
                                .requestFocus(confirmPasswordNode);
                          },
                          txt: 'New Password',
                          isObscure: true,
                          controller: passwordController,
                          isEnable: true,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.text,
                          prefixWidget: Icon(Icons.vpn_key),
                          validator: (String value) => value.isEmpty
                              ? "*" + 'Password'
                              : value.length < 8
                                  ? "Password cannot be less than 8 digits"
                                  : null,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        CustomTextFormField(
                          node: confirmPasswordNode,
                          txt: 'Confirm Password',
                          isObscure: true,
                          controller: confirmPasswordController,
                          isEnable: true,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.text,
                          prefixWidget: Icon(Icons.vpn_key),
                          validator: (String value) => value.isEmpty
                              ? "*" + 'Confirm Password'
                              : value != passwordController.text
                                  ? "Password doesn't match"
                                  : null,
                        ),
                        SizedBox(height: size.height * 0.02),
                        createPasswordProvider.isLoading()
                            ? Center(
                                child: GifLoader(),
                              )
                            : Container(
                                width: size.width * 0.45,
                                child: RaisedButton(
                                  padding: EdgeInsets.all(12.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  color: ColorConstants.white,
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                    } else {
                                      createPasswordProvider
                                          .setIsValidated(true);
                                    }
                                  },
                                  child: Text(
                                    "Create Password",
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
