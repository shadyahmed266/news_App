import 'dart:ui';

import '../my_theme.dart';

class CategoryDM {
  String id;
  String title;
  String imagePath;
  Color color;

  CategoryDM(
      {required this.title,
      required this.id,
      required this.color,
      required this.imagePath});

  static List<CategoryDM> getCategories() {
    return [
      CategoryDM(
          title: "Sports",
          id: "sports",
          color: MyTheme.redColor,
          imagePath: "assets/images/ball.png"),
      CategoryDM(
          title: "General",
          id: "general",
          color: MyTheme.darkBlueColor,
          imagePath: "assets/images/Politics.png"),
      CategoryDM(
          title: "Health",
          id: "health",
          color: MyTheme.pinkColor,
          imagePath: "assets/images/health.png"),
      CategoryDM(
          title: "Business",
          id: "business",
          color: MyTheme.brownColor,
          imagePath: "assets/images/bussines.png"),
      CategoryDM(
          title: "Entertainment",
          id: "entertainment",
          color: MyTheme.blueColor,
          imagePath: "assets/images/environment.png"),
      CategoryDM(
          title: "Science",
          id: "science",
          color: MyTheme.yellowColor,
          imagePath: "assets/images/science.png"),
      CategoryDM(
          title: "Technology",
          id: "technology",
          color: MyTheme.darkBlueColor,
          imagePath: "assets/images/science.png"),
    ];
  }
}
