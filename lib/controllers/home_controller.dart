import 'package:plants_app/constants/app_imports.dart';

class HomeController extends GetxController {
  NavBarController navBarController = Get.find();
  List<CategoryModel> categories = [
    CategoryModel(
      AppStrings.allText,
      isSelected: true,
    ),
    CategoryModel(
      AppStrings.indoorText,
      isSelected: false,
    ),
    CategoryModel(
      AppStrings.outdoorText,
      isSelected: false,
    ),
    CategoryModel(
      AppStrings.cactusText,
      isSelected: false,
    ),
    CategoryModel(
      AppStrings.otherText,
      isSelected: false,
    ),
  ];
}
