import 'package:ecommerce/features/layout/presentation/controller/Layout_Cubit/layout_cubit.dart';
import 'package:ecommerce/features/layout/presentation/views/widgets/Product_details_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getProducts(),
      child: Scaffold(
          appBar: AppBar(),
          body: ProdectDetailsBody(
            index: index,
          )),
    );
  }
}
