import 'dart:ui';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
  });
  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: "business",
          name: "Business",
          image: "assets/images/bussines.png",
          color: Color(0xffCF7E48)),
      CategoryModel(
          id: "sports",
          name: "Sports",
          image: "assets/images/sports.png",
          color: Color(0xffC91C22)),
      CategoryModel(
          id: "politics",
          name: "Politics",
          image: "assets/images/Politics.png",
          color: Color(0xff003E90)),
      CategoryModel(
          id: "health",
          name: "Health",
          image: "assets/images/health.png",
          color: Color(0xffED1E79)),
      CategoryModel(
          id: "enviroment",
          name: "Enviroment",
          image: "assets/images/environment.png",
          color: Color(0xff4882CF)),
      CategoryModel(
          id: "science",
          name: "Science",
          image: "assets/images/science.png",
          color: Color(0xffF2D352)),
    ];
  }
}
