import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/Headings/SectionHeading.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ShopLanding/ProductCardShopLanding/ProductCardShopLanding.dart';
import '../../../../Utils/Globals.dart' as globals;

class TopBuys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading('Top Buys'),
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
              brandTitle: 'Samsung',
              currency: globals.currency,
              discountedPercentage: '20',
              isDiscounted: false,
              productImage: "https://images.unsplash.com/photo-1517487881594-2787fef5ebf7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NjN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              productPrice: '250.00',
              productTitle: "Samsung Gear with Earbuds",
              rating: '3.3',
            ),
          ),
        ),
      ],
    );
  }
}
