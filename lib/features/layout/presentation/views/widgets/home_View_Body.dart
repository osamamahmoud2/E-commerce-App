import 'package:ecommerce/core/network/Cache_Networ.dart';
import 'package:ecommerce/features/authantication/presentation/views/login_view.dart';
import 'package:ecommerce/features/layout/presentation/controller/Layout_Cubit/layout_cubit.dart';
import 'package:ecommerce/features/layout/presentation/views/category_View.dart';
import 'package:ecommerce/features/layout/presentation/views/widgets/Banner_PageView.dart';
import 'package:ecommerce/features/layout/presentation/views/widgets/Gategory_ListView.dart';
import 'package:ecommerce/features/layout/presentation/views/widgets/Product_Item.dart';
import 'package:ecommerce/features/layout/presentation/views/widgets/Search_Text_Faild.dart';
import 'package:ecommerce/features/layout/presentation/views/widgets/simmerUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:animate_do/animate_do.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          bool inAsyncCall = false;
          return ModalProgressHUD(
            inAsyncCall: inAsyncCall,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: cubit.products.isEmpty
                    ? const ShimmerUi()
                    : ListView(
                        physics: const BouncingScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        // shrinkWrap: true,
                        children: [
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            children: [
                              SlideInLeft(
                                duration: const Duration(seconds: 1),
                                animate: true,
                                child: const Text(
                                  'Explore What You \n Needs...',
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              Image.asset('assets/images/Vector (3).png'),
                              const SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      inAsyncCall = true;
                                    });
                                    Future.delayed(const Duration(seconds: 4),
                                        () {
                                      CacheNetwork.deleteFromCache(
                                          key: "token");
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const LoginView();
                                      }));
                                    });
                                    setState(() {
                                      inAsyncCall = false;
                                    });
                                  },
                                  child: Image.asset(
                                      'assets/images/Vector (4).png')),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeInLeft(
                              animate: true,
                              duration: const Duration(seconds: 1),
                              child: const SearchFormAproduct()),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SlideInRight(
                                animate: true,
                                duration: const Duration(seconds: 1),
                                child: const Text(
                                  'Categories',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const CategoryView();
                                  }));
                                },
                                child: const Text(
                                  'See all',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: Colors.blue,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeInRight(
                              duration: const Duration(seconds: 1),
                              child: const GategotyListView()),
                          const SizedBox(
                            height: 15,
                          ),
                          FadeInLeft(
                              duration: const Duration(seconds: 1),
                              child: const BannerPageView()),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Popular',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SlideInUp(
                            animate: true,
                            duration: const Duration(seconds: 0),
                            child: GridView.builder(
                              itemCount: cubit.products.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemBuilder: (context, index) {
                                return cubit.products.isNotEmpty
                                    ? ProductItem(
                                        cubit: cubit,
                                        index: index,
                                        name: cubit.products[index].name,
                                        imageUrl: cubit.products[index].image)
                                    : const Icon(Icons.error);
                              },
                            ),
                          )
                        ],
                      ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}


// class PopularGraidView extends StatelessWidget {
//   const PopularGraidView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
