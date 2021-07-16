import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/ProgressIndicators/GifLoader.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/AppHeader/AppHeader.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ErrorWidget/ErrorWidget.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/SearchField/SearchField.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ShopLanding/FeaturedProducts/FeaturedProducts.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ShopLanding/ProductCategories/ProductCategories.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ShopLanding/Promotions/PromotionsCarousel.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ShopLanding/TopBuys/TopBuys.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/ShopLanding/TopPicks/TopPicks.dart';
import 'package:infinity_basket_app_dev/Models/ProductCategories/ProductCategoriesResponseModel.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:infinity_basket_app_dev/Services/ShopLandingServices/ProductCategoriesService/ProductCategoriesService.dart';

class ShopLandingScreenUI extends StatefulWidget {
  final String marketPlaceID;

  ShopLandingScreenUI(this.marketPlaceID);

  @override
  _ShopLandingScreenUIState createState() => _ShopLandingScreenUIState();
}

class _ShopLandingScreenUIState extends State<ShopLandingScreenUI> {
  Future<ApiResponse<ProductCategoriesResponseModel>> productCategories;

  @override
  void initState() {
    productCategories = ProductCategoriesService()
        .getAllProductCategories(context, widget.marketPlaceID);
    super.initState();
  }

  Future _handleRefresh() async {
    setState(() {
      productCategories = ProductCategoriesService()
          .getAllProductCategories(context, widget.marketPlaceID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appHeader(context, isNavigatorPushed: true),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              SearchField(),
              SizedBox(height: 10),
              PromotionsCarousel(imageUrls: [
                "https://picsum.photos/1100/400",
                "https://picsum.photos/1200/500",
                "https://picsum.photos/1400/600",
                "https://picsum.photos/1600/700",
                "https://picsum.photos/1800/900",
              ]),
              SizedBox(height: 20),
              FeaturedProducts(),
              SizedBox(height: 20),
              TopBuys(),
              SizedBox(height: 20),
              TopPicks(),
              SizedBox(height: 20),
              StreamBuilder<ApiResponse<ProductCategoriesResponseModel>>(
                stream: productCategories.asStream(), // async work
                builder: (BuildContext context,
                    AsyncSnapshot<ApiResponse<ProductCategoriesResponseModel>>
                        snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Container(
                          height: 250, child: Center(child: GifLoader()));
                      break;
                    default:
                      if (snapshot.hasData) {
                        switch (snapshot.data.status) {
                          case Status.LOADING:
                            return Center(child: GifLoader());
                            break;
                          case Status.COMPLETED:
                            var responseData = snapshot.data.responseData.data;
                            return responseData != null && responseData.isNotEmpty
                                ? ProductCategories()
                                : SizedBox();
                            break;
                          case Status.ERROR:
                            return ShowError(
                              errorMessage: snapshot.data.message,
                              onRetryPressed: () => setState(() {}),
                            );
                            break;
                        }
                      }
                      return Container();
                      break;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
