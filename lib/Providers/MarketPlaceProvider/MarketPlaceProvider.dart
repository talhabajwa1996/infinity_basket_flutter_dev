import 'package:flutter/foundation.dart';
import 'package:infinity_basket_app_dev/Models/MarketPlaceModel/MarketPlaceResponseModel.dart';

class MarketPlaceProvider extends ChangeNotifier {
  MarketPlaceResponseModel _marketPlaceData;

  set setMarketPlaceData(MarketPlaceResponseModel data) {
    _marketPlaceData = data;
    notifyListeners();
  }

  MarketPlaceResponseModel get marketPlaceData => _marketPlaceData;
}
