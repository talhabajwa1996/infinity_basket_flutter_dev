import 'package:flutter/foundation.dart';
import 'package:infinity_basket_app_dev/Models/ProductCategories/ProductCategoriesResponseModel.dart';

class ProductCategoriesProvider extends ChangeNotifier {
  ProductCategoriesResponseModel _productCategories;

  set setProductCategories(ProductCategoriesResponseModel data) {
    _productCategories = data;
    notifyListeners();
  }

  ProductCategoriesResponseModel get productCategories => _productCategories;
}
