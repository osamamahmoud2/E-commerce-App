import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/layout/data/Models/Product_Model.dart';
import 'package:ecommerce/features/layout/presentation/controller/Layout_Cubit/layout_cubit.dart';
import 'package:ecommerce/features/layout/presentation/views/Products_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ProductModel? model;

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.index,
    required this.cubit,
  });
  final String imageUrl;
  final String name;
  final int index;
  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductDetailsView(
              index: index,
            );
          }));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter:
                      const ColorFilter.mode(Colors.black45, BlendMode.darken),
                  image: NetworkImage(imageUrl))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'see Item Details',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              cubit.addOrRemoveFromFavourite(
                  Product_Id: cubit.products[index].id.toString());
            },
            child: Icon(
              Icons.favorite,
              color:
                  cubit.productFavouriteList.contains(cubit.products[index].id)
                      ? Colors.red
                      : Colors.white,
              size: 30,
            ),
          ))
    ]);
  }
}
