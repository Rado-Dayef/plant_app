import 'package:plants_app/constants/app_imports.dart';

class DetailsController extends GetxController {
  PlantModel plantFromArguments = Get.arguments;
  RxInt count = RxInt(1);
  RxDouble totalPrice = RxDouble(0);

  @override
  void onInit() {
    totalPrice.value = plantFromArguments.price;
    super.onInit();
  }

  /// To increment the count with one and multiply it with the price.
  void onPlusOneToCount() {
    count.value++;
    totalPrice.value = count.value * plantFromArguments.price;
  }

  /// To decrement the count with one and multiply it with the price if its not equal one or less, But if the count equal one or less display toast to worn the user.
  void onMinusOneFromCount() {
    count.value == 1 ? AppDefaults.defaultToast(AppStrings.countCanNotBeLessThenOneToast) : count.value--;
    totalPrice.value = count.value * plantFromArguments.price;
  }

  /// To navigate from the details screen to the cart screen.
  void onBuyNowClick() {
    Get.toNamed(AppStrings.cartRoute, arguments: [plantFromArguments, count, totalPrice]);
  }
}
