import 'package:plants_app/constants/app_imports.dart';

class PlantModel {
  final RxInt count;
  final double star;
  final RxBool isFav;
  final String image;
  final String title;
  final double price;
  final RxBool inCart;

  PlantModel(
    this.image, {
    required this.star,
    required this.count,
    required this.title,
    required this.price,
    required this.isFav,
    required this.inCart,
  });
}
