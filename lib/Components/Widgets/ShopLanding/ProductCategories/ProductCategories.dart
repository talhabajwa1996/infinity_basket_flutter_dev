import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/Headings/SectionHeading.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ShopLanding/ProductCategoryCard/ProductCategoryCard.dart';
import 'package:infinity_basket_app_dev/Models/ProductCategories/ProductCategoriesResponseModel.dart';
import 'package:infinity_basket_app_dev/Providers/ShopLandingProviders/ProductCategoriesProvider/ProductCategoriesProvider.dart';
import 'package:provider/provider.dart';

class ProductCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading('Categories'),
        Consumer<ProductCategoriesProvider>(
            builder: (context, productCategoriesProvider, child) {
          List<ProductCategory> productCategories =
              productCategoriesProvider.productCategories.data;
          return Container(
            margin: EdgeInsets.only(top: 3.0),
            height: productCategories.length < 8 ? 124.5 : 248,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: productCategories.length < 8 ? 1 : 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 2.0),
              itemCount: productCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ProductCategoryCard(
                  categoryImage: productCategories[index].img,
                  categoryTitle: productCategories[index].title,
                );
              },
            ),
          );
        })
      ],
    );
  }
}
