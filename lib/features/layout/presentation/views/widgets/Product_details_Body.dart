import 'package:ecommerce/core/Primary_Color.dart';
import 'package:ecommerce/features/layout/presentation/controller/Layout_Cubit/layout_cubit.dart';
import 'package:ecommerce/features/layout/presentation/views/widgets/simmerUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProdectDetailsBody extends StatelessWidget {
  const ProdectDetailsBody({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);

          return cubit.products.isNotEmpty
              ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    cubit.products[index].image,
                                  )),
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12)),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.25,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          cubit.products[index].name,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '\$ ${cubit.increament * cubit.products[index].price}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Quantity',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff646464)),
                            ),
                            const Spacer(),
                            IconButton(
                                color: primarycolor,
                                onPressed: () {
                                  cubit.imcreamentThePrice(
                                      bottom: 'PLus',
                                      price:
                                          cubit.products[index].price.toInt());
                                },
                                icon: const Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                            Text(
                              '${cubit.increament}',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.blue),
                            ),
                            IconButton(
                                color: primarycolor,
                                onPressed: () {
                                  cubit.imcreamentThePrice(
                                      bottom: '-',
                                      price:
                                          cubit.products[index].price.toInt());
                                },
                                icon: const Text(
                                  '-',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color.fromARGB(255, 232, 241, 231)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: primarycolor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: primarycolor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: primarycolor,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '120 Review',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.5)),
                                  )
                                ],
                              ),
                              const Text(
                                '3.7',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset('assets/images/Frame 119.png')),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cubit.products[index].description,
                          maxLines: cubit.descTextShowFlag ? 20 : 6,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            cubit.chageshowflag();
                          },
                          child: Text(
                            cubit.descTextShowFlag ? 'read Less' : 'read More',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.blue),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/Frame 120.png'),
                            const Spacer(),
                            const Icon(
                              Icons.shopping_bag,
                              color: Colors.blue,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.addOrRemoveFromFavourite(
                                    Product_Id:
                                        cubit.products[index].id.toString());
                              },
                              child: Icon(
                                Icons.favorite_rounded,
                                color: cubit.productFavouriteList
                                        .contains(cubit.products[index].id)
                                    ? Colors.red
                                    : Colors.blue,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                )
              : const ShimmerUi();
        },
        listener: (context, state) {});
  }
}
