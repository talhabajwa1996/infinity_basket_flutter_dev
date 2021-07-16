import 'package:flutter/material.dart';
import 'package:infinity_basket_app_dev/Components/Carousel/CustomCarousel.dart';
import 'package:infinity_basket_app_dev/Components/CustomImages/NetworkImage.dart';
import 'package:infinity_basket_app_dev/Components/Widgets/Headings/SectionHeading.dart';

class PromotionsCarousel extends StatelessWidget {
  final List<String> imageUrls;

  PromotionsCarousel({this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading('Promotions'),
        CustomCarousel(
          autoPlay: true,
          carouselItems: List.generate(
            imageUrls.length,
            (index) => Padding(
              padding: EdgeInsets.only(right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: appNetworkImage(imageUrls[index], double.infinity,
                    double.infinity, BoxFit.fill),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
