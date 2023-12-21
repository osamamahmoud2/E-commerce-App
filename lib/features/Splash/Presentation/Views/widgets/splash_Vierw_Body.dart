import 'package:ecommerce/features/Splash/Presentation/Views/Auth_View.dart';
import 'package:ecommerce/features/on_bourding/presentation/view/onBourding_View.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      return Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
        return const OnBourdingView();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/Group 1.png',
          height: 135,
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/Kur E-Shop.png',
            height: 107,
          ),
        )
      ],
    );
  }
}
