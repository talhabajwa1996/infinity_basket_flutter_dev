import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';

class ShowError extends StatelessWidget {
  final String errorMessage;
  final Function onRetryPressed;
  final double height;

  const ShowError(
      {Key key, this.errorMessage, this.onRetryPressed, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/error.png",
              height: height ?? size.height * 0.3,
            ),
            SizedBox(height: 8.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: ColorConstants.primaryColor,
                onPressed: onRetryPressed,
                child: Text(
                  "Retry",
                  style: TextStyle(color: ColorConstants.white),
                  strutStyle: StrutStyle(
                    forceStrutHeight: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class EmptyData extends StatelessWidget {
  final String message;
  final double height;
  final double width;
  final String image;

  const EmptyData({Key key, this.message, this.height, this.width, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.secondaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.12),
        height: height ?? size.height * 0.55,
        width: width ?? size.width,
        child: Image.asset(image ?? "assets/images/no_product.png"),
      ),
    );
  }
}
class EmptyCart extends StatelessWidget {
  final String message;

  const EmptyCart({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.secondaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.12),
        height: size.height * 0.55,
        width: size.width,
        child: Image.asset("assets/images/no_item.png"),
      ),
    );
  }
}

