import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:infinity_basket_app_dev/Models/MarketPlaceModel/MarketPlaceResponseModel.dart';
import 'package:infinity_basket_app_dev/Providers/MarketPlaceProvider/MarketPlaceProvider.dart';
import 'package:infinity_basket_app_dev/Services/API/api.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:provider/provider.dart';

class MarketPlaceService {
  Future<ApiResponse<MarketPlaceResponseModel>> getMarketPlaceData(
      BuildContext context) async {
    try {
      var response = await Api.getRequestData("market_place/get_all");
      print(response.toString());
      MarketPlaceResponseModel marketPlaceData =
          MarketPlaceResponseModel.fromJson(response);
      var marketPlaceProvider =
          Provider.of<MarketPlaceProvider>(context, listen: false);
      marketPlaceProvider.setMarketPlaceData = marketPlaceData;
      return ApiResponse.completed(marketPlaceData);
    } catch (exception) {
      print(exception);
      return ApiResponse.error(exception.toString());
    }
  }
}
