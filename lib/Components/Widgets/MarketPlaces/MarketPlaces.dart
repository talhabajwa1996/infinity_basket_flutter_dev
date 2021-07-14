import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/MarketPlaces/MarketPlaceCategories.dart';
import 'package:infinity_basket_app_dev/Providers/MarketPlaceProvider/MarketPlaceProvider.dart';
import 'package:provider/provider.dart';

class MarketPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MarketPlaceProvider>(
      builder: (BuildContext context, providerData, child) {
        var data = providerData.marketPlaceData;
        return Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 12, right: 12),
                  child: MarketPlaceCategories(data.marketPlaceData),
                )),
          ],
        );
      },
    );
  }
}
