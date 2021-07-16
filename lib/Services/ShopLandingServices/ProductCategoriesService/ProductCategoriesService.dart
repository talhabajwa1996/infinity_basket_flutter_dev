import 'package:flutter/cupertino.dart';
import 'package:infinity_basket_app_dev/Models/ProductCategories/ProductCategoriesResponseModel.dart';
import 'package:infinity_basket_app_dev/Providers/ShopLandingProviders/ProductCategoriesProvider/ProductCategoriesProvider.dart';
import 'package:infinity_basket_app_dev/Services/API/api.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:provider/provider.dart';

class ProductCategoriesService {
  Future<ApiResponse<ProductCategoriesResponseModel>> getAllProductCategories(
      BuildContext context, String marketPlaceId) async {
    try {
      var response = await Api.getRequestData(
          "categories/get_by_id?market_place_id=$marketPlaceId");
      print(response.toString());
      ProductCategoriesResponseModel categoriesData =
          ProductCategoriesResponseModel.fromJson(response);
      var categoriesProvider =
          Provider.of<ProductCategoriesProvider>(context, listen: false);
      categoriesProvider.setProductCategories = categoriesData;
      return ApiResponse.completed(categoriesData);
    } catch (exception) {
      print(exception);
      return ApiResponse.error(exception.toString());
    }
  }
}
