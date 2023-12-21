class CategoryModel {
  final int id;
  String? name;
  final String image;

  CategoryModel({
    required this.id,
    this.name,
    required this.image,
  });
  factory CategoryModel.formJson({required dynamic data}) {
    return CategoryModel(
      id: data['id'],
      name: data['name'],
      image: data['image'],
    );
  }
}
