import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/GifLoader.dart';
import 'package:infinity_basket_app_dev/Components/SnackBar/showSnackBar.dart';
import 'package:infinity_basket_app_dev/Components/TextFields/CustomTextFormField.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/AppImageLogo/AppImageLogo.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/SignIn/SocialLogin.dart';
import 'package:infinity_basket_app_dev/Providers/SignInProvider/SignInProvider.dart';
import 'package:infinity_basket_app_dev/Routes/AppNavigation.dart';
import 'package:infinity_basket_app_dev/Services/AuthServices/SignInService.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/RouteConstants.dart';
import 'package:provider/provider.dart';
import '../../Utils/Globals.dart' as globals;

class SignInScreenUI extends StatefulWidget {
  @override
  _SignInScreenUIState createState() => _SignInScreenUIState();
}

class _SignInScreenUIState extends State<SignInScreenUI> {
  var formKey = new GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  FocusNode phoneNoNode = new FocusNode();
  FocusNode passwordNode = new FocusNode();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneNoController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<SignInProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.secondaryColor,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.10),
            appImageLogo(size.height * 0.18, size.width * 0.4),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              'Login to Your Account',
              style: TextStyle(color: ColorConstants.white, fontSize: 16),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.06, vertical: size.height * 0.04),
              child: Form(
                key: formKey,
                autovalidate: user.getIsValidated(),
                child: Column(
                  children: <Widget>[
                    CustomTextFormField(
                      node: phoneNoNode,
                      onFieldSubmit: (value) {
                        FocusScope.of(context).requestFocus(phoneNoNode);
                      },
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
                      controller: _phoneNoController,
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                      validator: (String value) =>
                          value.isEmpty || value.length != 10
                              ? "Please enter a valid Phone No"
                              : null,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Consumer<SignInProvider>(
                        builder: (context, providerData, child) {
                      return Stack(
                        alignment: Alignment(1.0, -1.0),
                        children: [
                          CustomTextFormField(
                            node: passwordNode,
                            txt: 'Password',
                            isObscure: providerData.isObscureText,
                            controller: _passwordController,
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.done,
                            prefixWidget: Icon(Icons.lock),
                            suffixWidget: SizedBox(),
                            validator: (String value) => (value.isEmpty)
                                ? "Please Enter Password"
                                : value.length < 8
                                    ? 'Password cannot be less than 8 digits'
                                    : null,
                            onChange: (value) {
                              user.setError(false);
                            },
                          ),
                          SizedBox(
                            height: 48,
                            width: 48,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              onTap: () {
                                providerData.setPasswordObscure();
                              },
                              child: Icon(
                                providerData.isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ColorConstants.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 1.0),
                      child: Text(
                        user.getError() ? user.getMessage() : "",
                        style:
                            TextStyle(color: ColorConstants.red, fontSize: 12),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        AppNavigation().navigateTo('/forget-password');
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: ColorConstants.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width * 0.35,
                  child: RaisedButton(
                    padding: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: Colors.white,
                    onPressed: () {
                      AppNavigation().navigateTo(RouteConstants.signUp);
                      user.setError(false);
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: ColorConstants.primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Container(
                  width: size.width * 0.35,
                  child: RaisedButton(
                    padding: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: ColorConstants.black,
                    onPressed: () async {
                      String phoneNo = "${globals.countryCode}${_phoneNoController.text}";
                      print(phoneNo);
                      if (formKey.currentState.validate()) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        await SignInService()
                            .loginUser(
                                phoneNo,
                                _passwordController.text,
                                context)
                            .then((signInResponse) {
                          if (signInResponse.responseData.status == 200) {
                            // AppNavigation()
                            //     .pushReplacementTo(RouteConstants.bottomBarUi);
                          } else {
                            showSnackBar(
                                signInResponse.responseData.message, context);
                          }
                        });
                      } else {
                        user.setIsValidated(true);
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: ColorConstants.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: size.height * 0.1,
              child: user.isLoading() ? GifLoader() : SizedBox(),
            ),
            SocialLoginIcons(width: size.width, height: 300)
          ],
        ),
      ),
    );
  }
}
