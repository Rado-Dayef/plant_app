import 'package:plants_app/constants/app_imports.dart';

class PlantModel {
  final bool isFav;
  final double star;
  final String image;
  final String title;
  final double price;

  PlantModel(
    this.image, {
    required this.star,
    required this.title,
    required this.price,
    required this.isFav,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      json[AppStrings.imageJSONText],
      title: json[AppStrings.titleJSONText],
      isFav: json[AppStrings.isFavJSONText],
      price: json[AppStrings.priceJSONText].toDouble(),
      star: json[AppStrings.starJSONText].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        AppStrings.starJSONText: star,
        AppStrings.imageJSONText: image,
        AppStrings.titleJSONText: title,
        AppStrings.priceJSONText: price,
        AppStrings.isFavJSONText: isFav,
      };
}
