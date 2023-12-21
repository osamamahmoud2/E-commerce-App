import 'package:ecommerce/core/Primary_Color.dart';
import 'package:ecommerce/features/layout/presentation/controller/Layout_Cubit/layout_cubit.dart';
import 'package:ecommerce/features/layout/presentation/views/category_View.dart';
import 'package:ecommerce/features/layout/presentation/views/widgets/home_View_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()
        ..getGategory()
        ..getBanners()
        ..getProducts()
        ..getfavourite(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
          builder: ((context, state) {
            final cubit = BlocProvider.of<LayoutCubit>(context);
            return Scaffold(
              bottomNavigationBar: SizedBox(
                height: MediaQuery.of(context).size.height * 0.069,
                child: BottomNavigationBar(
                    selectedItemColor: primarycolor,
                    unselectedItemColor: primarycolor,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: cubit.bottomNavcurrentIndex,
                    onTap: (index) {
                      BlocProvider.of<LayoutCubit>(context)
                          .changeIndex(index: index);
                    },
                    items: [
                      BottomNavigationBarItem(
                        label: 'Home',
                        activeIcon: Image.asset(
                            'assets/images/Property 1=Bold, Property 2=Home.png'),
                        icon: Image.asset(
                          'assets/images/Property 1=Light-Outline, Property 2=Home.png',
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: 'Category',
                        activeIcon: Image.asset(
                            'assets/images/Property 1=Bold, Property 2=Bag-2.png'),
                        icon: Image.asset(
                          'assets/images/Iconly (1).png',
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: 'favourite',
                        activeIcon: Image.asset(
                            'assets/images/Property 1=Bold, Property 2=Heart.png'),
                        icon: Image.asset('assets/images/Iconly (2).png'),
                      ),
                      BottomNavigationBarItem(
                        label: 'Profile',
                        activeIcon: Image.asset(
                            'assets/images/Property 1=Bold, Property 2=Profile.png'),
                        icon: Image.asset('assets/images/Iconly (3).png'),
                      )
                    ]),
              ),
              body: cubit.screens[cubit.bottomNavcurrentIndex],
            );
          }),
          listener: (context, state) {}),
    );
  }
}
