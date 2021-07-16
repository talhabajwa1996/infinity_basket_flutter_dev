import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/Headings/SectionHeading.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ShopLanding/ProductCardShopLanding/ProductCardShopLanding.dart';
import '../../../../Utils/Globals.dart' as globals;

class TopPicks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading('Top Picks'),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            itemCount: 10,
            itemBuilder: (context, index) => ProductsCardShopLanding(
              discountedPrice: '350.99',
              itemHeight: 220,
              itemWidth: 110,
              productId: '1',
              brandTitle: 'SONY',
              currency: globals.currency,
              discountedPercentage: '50',
              isDiscounted: true,
              productImage: "https://images.unsplash.com/photo-1501004318641-b39e6451bec6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8ODZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              productPrice: '175.45',
              productTitle: "Sony Smart TV",
              rating: '4.5',
            ),
          ),
        ),
      ],
    );
  }
}
