import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final double height;
  final List<Widget> carouselItems;
  final bool autoPlay;
  final int initialPage;
  final double viewPortFraction;

  CustomCarousel(
      {this.height,
      this.carouselItems,
      this.autoPlay,
      this.initialPage,
      this.viewPortFraction});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            height: height ?? 150,
            enableInfiniteScroll: false,
            initialPage: initialPage ?? 0,
            viewportFraction: viewPortFraction ?? 0.9,
            autoPlay: autoPlay ?? false),
        items: carouselItems);
  }
}
