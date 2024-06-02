import 'package:plants_app/constants/app_imports.dart';

class NavBarController extends GetxController {
  RxInt index = RxInt(1);
  RxList<PlantModel> favPlantList = RxList();
  RxList<PlantModel> cartPlantList = RxList();
  List<PlantModel> plantList = [
    PlantModel(
      AppStrings.jadeImage,
      star: 3.5,
      title: AppStrings.jadeText,
      price: 40.25,
      isFav: RxBool(true),
      inCart: RxBool(false),
      count: RxInt(1),
    ),
    PlantModel(
      AppStrings.cactusImage,
      star: 4.7,
      title: AppStrings.cactusText,
      price: 23.75,
      isFav: RxBool(false),
      inCart: RxBool(false),
      count: RxInt(1),
    ),
    PlantModel(
      AppStrings.philodendronImage,
      star: 3.8,
      title: AppStrings.philodendronText,
      price: 30.50,
      isFav: RxBool(false),
      inCart: RxBool(false),
      count: RxInt(1),
    ),
    PlantModel(
      AppStrings.monsteraImage,
      star: 3.4,
      title: AppStrings.monsteraText,
      price: 35.25,
      isFav: RxBool(true),
      inCart: RxBool(false),
      count: RxInt(1),
    ),
    PlantModel(
      AppStrings.aloeVeraImage,
      star: 4.9,
      title: AppStrings.aloeVeraText,
      price: 20.50,
      isFav: RxBool(true),
      inCart: RxBool(false),
      count: RxInt(1),
    ),
    PlantModel(
      AppStrings.rubberImage,
      star: 1.9,
      title: AppStrings.rubberText,
      price: 43.65,
      isFav: RxBool(false),
      inCart: RxBool(false),
      count: RxInt(1),
    ),
  ];

  @override
  void onInit() {
    favPlantList.value = plantList.where((plant) => plant.isFav.value).toList();
    cartPlantList.value = plantList.where((plant) => plant.inCart.value).toList();
    super.onInit();
  }

  /// To add or remove plant item to the favorite list.
  void checkAndAddToFavPlantListOrDeleteFromFavPlantList(PlantModel plant) {
    bool isExist = favPlantList.contains(plant);
    isExist ? favPlantList.remove(plant) : favPlantList.add(plant);
    plant.isFav.value = !plant.isFav.value;
  }

  /// To add or remove plant item to the cart list.
  void checkAndAddToCartPlantListOrDeleteFromCartPlantList(PlantModel plant) {
    bool isExist = cartPlantList.contains(plant);
    isExist ? cartPlantList.remove(plant) : cartPlantList.add(plant);
    plant.inCart.value = !plant.inCart.value;
  }

  /// To navigate from the home screen to the details screen.
  void onPlantItemClick(PlantModel plant) {
    Get.toNamed(AppStrings.detailsRoute, arguments: plant);
  }

  /// To increment the count with one and multiply it with the price.
  void onPlusOneToTheCountOfThePlantItem(PlantModel plant) {
    plant.count.value++;
  }

  /// To decrement the count with one and multiply it with the price if its not equal one or less, But if the count equal one or less display toast to worn the user.
  void onMinusOneFromTheCountOfThePlantItem(PlantModel plant) {
    plant.count.value == 1 ? AppDefaults.defaultToast(AppStrings.countCanNotBeLessThenOneToast) : plant.count.value--;
  }
}
