import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';

class SectionHeading extends StatelessWidget {
  final String headingText;

  SectionHeading(this.headingText);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.all(10),
      child: Text(
        headingText,
        style: TextStyle(
            color: ColorConstants.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
    );
  }
}
