import 'dart:ffi';

class ProductModel {
  final int id;
  final num price;
  final num oldprice;
  final String image;
  final String name;
  final String description;

  ProductModel(
      {required this.id,
      required this.price,
      required this.oldprice,
      required this.image,
      required this.name,
      required this.description});
  factory ProductModel.fromJson({required dynamic data}) {
    return ProductModel(
        id: data['id'],
        price: data['price'],
        oldprice: data['old_price'],
        image: data['image'],
        name: data['name'],
        description: data['description']);
  }
  @override
  String toString() {
    return image;
  }
}
