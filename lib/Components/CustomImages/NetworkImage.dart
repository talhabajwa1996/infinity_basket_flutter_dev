import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/AppLoader.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ImageConstants.dart';

Widget appNetworkImage(url, double width, double height, BoxFit boxFit,
    {Color color}) {
  return CachedNetworkImage(
    fit: boxFit,
    imageUrl: url,
    width: width,
    color: color,
    height: height,
    progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: AppLoader(
          value: downloadProgress.progress,
          strokeWidth: 1.5,
        )),
    errorWidget: (context, url, error) => Image.asset(
      ImageConstants.noImage,
      height: height,
      width: width,
    ),
  );
}
