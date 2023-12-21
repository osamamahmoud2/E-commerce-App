import 'package:ecommerce/features/layout/presentation/controller/Layout_Cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class GategotyListView extends StatelessWidget {
  const GategotyListView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          return SizedBox(
            height: 87,
            child: cubit.categories.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.categories.length,
                    itemBuilder: (context, inndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: cubit.colors[inndex],
                          ),
                          height: 100,
                          width: 165,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 79,
                                child: Text(
                                  cubit.categories[inndex].name!,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                  child: CircleAvatar(
                                radius: 35,
                                child: CircleAvatar(
                                    radius: 32,
                                    backgroundImage: NetworkImage(
                                        cubit.categories[inndex].image)),
                              ))
                            ],
                          ),
                        ),
                      );
                    })
                : Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey),
                      height: 100,
                      width: 165,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 79,
                          ),
                          Expanded(
                              child: CircleAvatar(
                                  radius: 35,
                                  child: CircleAvatar(
                                    radius: 32,
                                  )))
                        ],
                      ),
                    ),
                  ),
          );
        },
        listener: (context, state) {});
  }
}
