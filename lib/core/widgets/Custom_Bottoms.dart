import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/Primary_Color.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom(
      {super.key, required this.pageController, required this.onTap});
  final VoidCallback onTap;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primarycolor, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          (pageController.page != 2 ? 'Next' : "Get Start"),
          style: const TextStyle(fontSize: 15),
        )),
      ),
    );
  }
}
