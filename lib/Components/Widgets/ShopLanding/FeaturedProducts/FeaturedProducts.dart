import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/Headings/SectionHeading.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ShopLanding/ProductCardShopLanding/ProductCardShopLanding.dart';
import '../../../../Utils/Globals.dart' as globals;

class FeaturedProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading('Featured Products'),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            itemCount: 10,
            itemBuilder: (context, index) => ProductsCardShopLanding(
              discountedPrice: '120.45',
              itemHeight: 220,
              itemWidth: 110,
              productId: '1',
              brandTitle: 'HUAWEI',
              currency: globals.currency,
              discountedPercentage: '20',
              isDiscounted: true,
              productImage: "https://images.unsplash.com/photo-1492707892479-7bc8d5a4ee93?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=401&q=80",
              productPrice: '150.00',
              productTitle: "Cellular Earphones",
              rating: '3.3',
            ),
          ),
        ),
      ],
    );
  }
}
