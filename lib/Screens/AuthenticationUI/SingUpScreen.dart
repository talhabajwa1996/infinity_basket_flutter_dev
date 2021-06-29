import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:infinity_basket_app_dev/Components/TextFields/CustomTextFormField.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/AppImageLogo/AppImageLogo.dart';
import 'package:infinity_basket_app_dev/Routes/AppNavigation.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/RouteConstants.dart';
import '../../Utils/Globals.dart' as globals;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = new GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool autoValidate = false;
  FocusNode firstNameFocusNode = new FocusNode();
  FocusNode lastNameFocusNode = new FocusNode();
  FocusNode contactNoFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode confirmPasswordFocusNode = new FocusNode();

  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  MaskedTextController _contactNoController =
      new MaskedTextController(mask: '00000000000');
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorConstants.secondaryColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Form(
          key: formKey,
          autovalidate: autoValidate,
          child: Container(
            height: size.height,
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.07),
                appImageLogo(size.height * 0.10, size.width * 0.4),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Text(
                  'Create New Account',
                  style: TextStyle(color: ColorConstants.white, fontSize: 16),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomTextFormField(
                        node: firstNameFocusNode,
                        onFieldSubmit: (value) {
                          FocusScope.of(context)
                              .requestFocus(lastNameFocusNode);
                        },
                        txt: 'First Name',
                        prefixWidget: Icon(Icons.person),
                        controller: _firstNameController,
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        validator: (String value) =>
                            value.isEmpty ? "*" + "First Name" : null,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        node: lastNameFocusNode,
                        onFieldSubmit: (value) {
                          FocusScope.of(context)
                              .requestFocus(contactNoFocusNode);
                        },
                        txt: 'Last Name',
                        prefixWidget: Icon(Icons.person),
                        controller: _lastNameController,
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        validator: (String value) =>
                            value.isEmpty ? "*" + "Last Name" : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFormField(
                  node: contactNoFocusNode,
                  onFieldSubmit: (value) {
                    FocusScope.of(context).requestFocus(emailFocusNode);
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
                  controller: _contactNoController,
                  inputType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  validator: (String value) =>
                      value.isEmpty || value.length != 10
                          ? "Please enter a valid Phone No"
                          : null,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFormField(
                  node: emailFocusNode,
                  onFieldSubmit: (value) {
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                  txt: 'Email Address',
                  prefixWidget: Icon(Icons.alternate_email),
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                  validator: (String value) => value.isEmpty
                      ? "*" + 'Email Address'
                      : !EmailValidator.validate(value)
                          ? "Invalid Email"
                          : null,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFormField(
                  node: passwordFocusNode,
                  txt: 'Password',
                  prefixWidget: Icon(Icons.lock),
                  isObscure: true,
                  controller: _passwordController,
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (String value) => value.isEmpty
                      ? "*" + 'Password'
                      : value.length < 8
                          ? "Password cannot be less than 8 digits"
                          : null,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFormField(
                  node: confirmPasswordFocusNode,
                  txt: 'Confirm Password',
                  prefixWidget: Icon(Icons.lock),
                  isObscure: true,
                  controller: _confirmPasswordController,
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (String value) => value.isEmpty
                      ? "*" + 'Confirm Password'
                      : value != _passwordController.text
                          ? "Password doesn't match"
                          : null,
                ),
                SizedBox(height: size.height * 0.02),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(child: SizedBox()),
                Container(
                  width: size.width * 0.60,
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: Colors.white,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        Navigator.of(context).pushNamed(RouteConstants.otp);
                      }
                    },
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(color: ColorConstants.primaryColor),
                      strutStyle: StrutStyle(
                        forceStrutHeight: true,
                      ),
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
