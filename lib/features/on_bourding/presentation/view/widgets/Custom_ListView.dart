import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pagecontroll});
  final PageController pagecontroll;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 170),
      child: PageView(
        controller: pagecontroll,
        children: [
          Column(
            children: [
              FadeInLeft(
                animate: true,
                child: Image.asset(
                  'assets/images/Get your order.png',
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SlideInLeft(
                animate: true,
                child: const Text(
                  'Get your order !!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SlideInRight(
                animate: true,
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing,\nsed do eiusmod tempor ut labore',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Column(
            children: [
              SlideInRight(
                child: Image.asset(
                  'assets/images/Track Order.png',
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FadeInDown(
                child: const Text(
                  'Track order !!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SlideInLeft(
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing,\nsed do eiusmod tempor ut labore',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Column(
            children: [
              SlideInDown(
                child: Image.asset(
                  'assets/images/Purchase online.png',
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FadeInLeft(
                child: const Text(
                  'Purchase Online !!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SlideInLeft(
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing,\nsed do eiusmod tempor ut labore',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
