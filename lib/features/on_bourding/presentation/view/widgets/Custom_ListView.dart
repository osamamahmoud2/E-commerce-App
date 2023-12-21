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
              Image.asset(
                'assets/images/Get your order.png',
                height: 250,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Get your order !!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing,\nsed do eiusmod tempor ut labore',
                textAlign: TextAlign.center,
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/images/Track Order.png',
                height: 250,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Track order !!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing,\nsed do eiusmod tempor ut labore',
                textAlign: TextAlign.center,
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/images/Purchase online.png',
                height: 250,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Purchase Online !!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing,\nsed do eiusmod tempor ut labore',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      ),
    );
  }
}
