import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/CustomImages/NetworkImage.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';

class ProductsCardShopLanding extends StatelessWidget {
  final String productId;
  final String productImage;
  final String productTitle;
  final String brandTitle;
  final bool isDiscounted;
  final String discountedPercentage;
  final String productPrice;
  final String currency;
  final String rating;
  final double itemHeight;
  final double itemWidth;
  final String discountedPrice;

  ProductsCardShopLanding(
      {this.brandTitle,
      this.isDiscounted,
      this.currency,
      this.rating,
      this.productId,
      this.productTitle,
      this.discountedPercentage,
      this.productImage,
      this.productPrice,
      this.itemWidth,
      this.discountedPrice,
      this.itemHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: InkWell(
        onTap: () {},
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Stack(
            children: [
              Container(
                height: itemHeight,
                width: itemWidth,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 26),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: itemHeight * 0.30,
                        child: Center(
                          child: appNetworkImage(productImage, itemWidth,
                              itemHeight * 0.30, BoxFit.contain),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: isDiscounted
                                  ? RichText(
                                      strutStyle: StrutStyle(
                                        forceStrutHeight: true,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      text: new TextSpan(
                                        style: TextStyle(
                                            color: ColorConstants.gray,
                                            decoration:
                                                TextDecoration.lineThrough),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "$currency ",
                                            style: TextStyle(fontSize: 8),
                                          ),
                                          TextSpan(
                                            text: productPrice,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Text(
                                      '',
                                      style: TextStyle(fontSize: 12),
                                    ),
                            ),
                            Text(
                              productTitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w500),
                              strutStyle: StrutStyle(
                                height: 1.1,
                                forceStrutHeight: true,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              brandTitle,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 11),
                              strutStyle: StrutStyle(
                                height: 1.0,
                                forceStrutHeight: true,
                              ),
                            ),
                            SizedBox(height: 2.0),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: new TextSpan(
                              style: TextStyle(
                                color: ColorConstants.orange,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "$currency ",
                                  style: TextStyle(fontSize: 8),
                                ),
                                TextSpan(
                                  text: isDiscounted
                                      ? "$discountedPrice"
                                      : "$productPrice",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, bottom: 3, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(rating,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                                Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 15,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              isDiscounted
                  ? Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        child: Text(
                          '$discountedPercentage % OFF',
                          style: TextStyle(
                              fontSize: itemWidth * 0.07,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
