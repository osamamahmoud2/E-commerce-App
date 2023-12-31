import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/Primary_Color.dart';
import 'package:ecommerce/core/api_Service.dart';
import 'package:ecommerce/features/layout/data/Models/Categoery_Model.dart';
import 'package:ecommerce/features/layout/data/Models/Product_Model.dart';
import 'package:ecommerce/features/layout/presentation/views/Favourite_View.dart';
import 'package:ecommerce/features/layout/presentation/views/Profile_View.dart';
import 'package:ecommerce/features/layout/presentation/views/category_View.dart';
import 'package:ecommerce/features/layout/presentation/views/widgets/home_View_Body.dart';
import 'package:flutter/material.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int increament = 1;
  bool descTextShowFlag = false;

  chageshowflag() {
    descTextShowFlag = !descTextShowFlag;
    emit(ChangeReadFlag());
  }

  imcreamentThePrice({required int price, required String bottom}) {
    if (bottom == 'PLus') {
      increament++;

      increament * price;
      emit(DecreamentPrice());
    } else if (bottom == '-') {
      increament--;

      increament * price;
      emit(IncreamentPrice());
    }
  }

  List<Widget> screens = [
    const HomeViewBody(),
    const CategoryView(),
    const FavouriteView(),
    const ProfileView()
  ];
  int bottomNavcurrentIndex = 0;
  List<CategoryModel> categories = [];
  List<Color> colors = [
    primarycolor,
    const Color(0xffAFE0CE),
    const Color.fromARGB(255, 49, 37, 7),
    const Color(0xffbbd0ff),
    const Color(0xff3a5a40)
  ];
  void changeIndex({required int index}) {
    bottomNavcurrentIndex = index;
    emit(ChangeCurrentIndex());
  }

  void getGategory() async {
    var responseData = await ApiService().getReuest(endPoint: 'categories');

    if (responseData['status'] == true) {
      for (var item in responseData['data']['data']) {
        categories.add(CategoryModel.formJson(data: item));
        emit(GetCategorySuccessState());
      }
    } else {
      emit(GetCategoryFailureState());
    }
  }

  List<CategoryModel> banners = [];
  void getBanners() async {
    var responseData = await ApiService().getReuest(endPoint: 'banners');

    if (responseData['status'] == true) {
      for (var item in responseData['data']) {
        banners.add(CategoryModel.formJson(data: item));
        emit(GetBannerSuccessState());
      }
    } else {
      emit(GetBannerFailureState());
    }
  }

  List<ProductModel> products = [];
  void getProducts() async {
    try {
      var responseData = await ApiService().getReuest(endPoint: 'products');

      if (responseData['status'] == true) {
        for (var item in responseData['data']['data']) {
          products.add(ProductModel.fromJson(data: item));
          emit(GetProductsSuess());
        }
      } else {
        emit(GetProductsFailure());
      }
    } on Exception catch (e) {
      print('Bad State');
    }
  }

  List<ProductModel> favourite = [];
  Set<dynamic> productFavouriteList = {};
  Future getfavourite() async {
    favourite.clear();
    var responseData = await ApiService().getReuest(endPoint: 'favorites');
    if (responseData['status'] == true) {
      for (var item in responseData['data']['data']) {
        favourite.add(ProductModel.fromJson(data: item['product']));
        productFavouriteList.add(item['product']['id']);
        print("Favourite Products is $productFavouriteList}");
        emit(GetFavouriteSucessState());
      }
    } else {
      emit(GetFavouriteFailureState());
    }
  }

  void addOrRemoveFromFavourite({required String Product_Id}) async {
    var responseData = await ApiService().postRequest(
      endPoint: 'favorites',
      body: {'product_id': Product_Id},
    );
    if (responseData['status'] == true) {
      if (productFavouriteList.contains(Product_Id) == true) {
        productFavouriteList.remove(Product_Id);
      } else {
        productFavouriteList.add(Product_Id);
      }
      await getfavourite();
      emit(ADdOrRemoveFromFavouriteSucessState());
    } else {
      emit(ADdOrRemoveFromFavouriteFailureState());
    }
  }
}
