import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/CustomImages/NetworkImage.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';

class ProductCategoryCard extends StatelessWidget {
  final String categoryImage;
  final String categoryTitle;

  ProductCategoryCard({this.categoryImage, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          elevation: 10,
          child: Container(
            width: 82,
            height: 72,
            decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.circular(5)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Center(
                child: appNetworkImage(categoryImage, 82, 72, BoxFit.contain),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5.0),
          child: Text(
            categoryTitle,
            style: TextStyle(
              fontSize: 12,
              color: ColorConstants.black,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
