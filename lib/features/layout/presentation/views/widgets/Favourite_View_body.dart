import 'package:ecommerce/features/layout/presentation/controller/Layout_Cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
        builder: ((context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: cubit.favourite.isNotEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: 'Search ',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: cubit.favourite.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        height: 150,
                                        child: Image(
                                            image: NetworkImage(
                                                cubit.favourite[index].image)),
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.52,
                                            child: Text(
                                              cubit.favourite[index].name,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                                          Text(
                                            '${cubit.favourite[index].price} \$',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            color: const Color(0xff89E581),
                                            onPressed: () {},
                                            child: const Text('Remove'),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    )
                  : const Center(
                      child: Icon(
                      Icons.heart_broken,
                      size: 90,
                      color: Colors.red,
                    )),
            ),
          );
        }),
        listener: (context, state) {});
  }
}
