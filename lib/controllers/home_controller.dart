import 'package:plants_app/constants/app_imports.dart';

class HomeController extends GetxController {
  RxInt index = RxInt(0);
  List<PlantModel> plantList = [];
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

  /// To navigate from the home screen to the details screen.
  void onPlantItemClick(PlantModel plant) {
    Get.toNamed(AppStrings.detailsRoute, arguments: plant);
  }

  /// To load the plant data from the JSON file.
  Future<void> loadPlantData() async {
    try {
      String jsonString = await rootBundle.loadString(AppStrings.plantJSON);
      List<dynamic> jsonList = jsonDecode(jsonString);
      await Future.delayed(
        /// To create a delay with two second before assign the data into the list to display the shimmer animation.
        const Duration(
          seconds: 2,
        ),
        () => plantList = jsonList.map((json) => PlantModel.fromJson(json)).toList(),
      );
    } catch (e) {
      AppDefaults.defaultToast(e.toString());
    }
  }
}
