import 'package:ecommerce/core/Primary_Color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndecator extends StatelessWidget {
  const PageIndecator({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: WormEffect(
          spacing: 8.0,
          radius: 25.0,
          dotWidth: 10.0,
          dotHeight: 10.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          dotColor: Colors.grey,
          activeDotColor: primarycolor),
    );
  }
}
