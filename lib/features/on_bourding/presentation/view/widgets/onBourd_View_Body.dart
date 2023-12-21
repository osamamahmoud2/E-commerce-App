import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/core/Primary_Color.dart';
import 'package:ecommerce/core/widgets/Custom_Bottoms.dart';
import 'package:ecommerce/features/Splash/Presentation/Views/Auth_View.dart';
import 'package:ecommerce/features/on_bourding/presentation/view/widgets/Custom_ListView.dart';
import 'package:ecommerce/features/on_bourding/presentation/view/widgets/Custom_PageView_Indecator.dart';
import 'package:flutter/material.dart';

class OnBourdViewBody extends StatefulWidget {
  const OnBourdViewBody({super.key});

  @override
  State<OnBourdViewBody> createState() => _OnBourdViewBodyState();
}

class _OnBourdViewBodyState extends State<OnBourdViewBody> {
  PageController? conroller;
  @override
  void initState() {
    conroller = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 0.43,
            right: MediaQuery.of(context).size.width * 0.20,
            bottom: MediaQuery.of(context).size.height * 0.22,
            child: PageIndecator(
              controller: conroller!,
            ),
          ),
          CustomPageView(
            pagecontroll: conroller!,
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.width * 0.09,
              child: Visibility(
                  visible: conroller!.hasClients
                      ? (conroller!.page == 2 ? false : true)
                      : true,
                  child: GestureDetector(
                      onTap: () => conroller!.jumpToPage(3),
                      child: SlideInRight(
                          animate: true, child: const Text('Skip'))))),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              bottom: MediaQuery.of(context).size.height * 0.12,
              child: CustomBottom(
                onTap: () {
                  if (conroller!.page! < 2) {
                    conroller!.nextPage(
                        duration: const Duration(microseconds: 100),
                        curve: Curves.easeInBack);
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const AuthView();
                    }));
                  }
                },
                pageController: conroller!,
              )),
        ],
      ),
    );
  }
}
