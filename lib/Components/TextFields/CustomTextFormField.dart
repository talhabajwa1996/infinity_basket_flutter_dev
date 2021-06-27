import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Utils/ColorConstants.dart';

class CustomTextFormField extends StatelessWidget {
  final String txt;
  final bool isEnable, isObscure;
  final TextInputType inputType;
  final TextEditingController controller;
  final FocusNode node;
  final Function validator, onFieldSubmit, onChange;
  final TextInputAction inputAction;
  final bool readOnly;
  final String hintText;
  final Widget suffixWidget, prefixWidget;
  final Function() onTap;
  final VoidCallback onPressedLeadingIcon;
  final String labelText;
  final double padding;
  final int maxLines;

  CustomTextFormField(
      {this.validator,
      this.inputAction,
      this.isEnable = true,
      this.isObscure = false,
      this.onFieldSubmit,
      this.prefixWidget,
      this.txt,
      this.inputType,
      this.controller,
      this.node,
      this.onChange,
      this.onTap,
      this.suffixWidget,
      this.hintText,
      this.readOnly = false,
      this.onPressedLeadingIcon,
      this.labelText,
      this.maxLines = 1,
      this.padding = 0.0});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 15.0),
      cursorColor: Colors.black,
      onTap: onTap,
      enabled: isEnable,
      obscureText: isObscure,
      focusNode: node,
      textCapitalization: inputType == TextInputType.emailAddress
          ? TextCapitalization.none
          : TextCapitalization.sentences,
      onFieldSubmitted: onFieldSubmit,
      controller: controller,
      textInputAction: inputAction,
      keyboardType: inputType,
      maxLines: maxLines,
      readOnly: readOnly,
      decoration: InputDecoration(
          prefixIcon: prefixWidget ?? null,
          hintText: txt,
          labelText: labelText,
          suffixIcon: suffixWidget ?? null,
          hintStyle: TextStyle(color: ColorConstants.gray, fontSize: 14.0),
          border: new OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.primaryColor),
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstants.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstants.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstants.primaryColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstants.primaryColor),
          ),
          errorStyle: TextStyle(color: ColorConstants.white, height: 1.1),
          errorMaxLines: 3,
          contentPadding: EdgeInsets.only(left: 10.0, top: padding),
          fillColor: Colors.white,
          filled: true),
      validator: validator,
      onChanged: onChange,
      onSaved: (String val) {
        controller.text = val;
      },
    );
  }
}
