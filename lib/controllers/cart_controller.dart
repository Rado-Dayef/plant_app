import 'package:plants_app/constants/app_imports.dart';

class CartController extends GetxController {
  PlantModel plantFromArguments = Get.arguments[0];
  RxInt countFromArguments = Get.arguments[1];
  RxDouble totalPrice = Get.arguments[2];

  /// To increment the count with one and multiply it with the price.
  void onPlusOneToCount() {
    countFromArguments.value++;
    totalPrice.value = countFromArguments.value * plantFromArguments.price;
  }

  /// To decrement the count with one and multiply it with the price if its not equal one or less, But if the count equal one or less display toast to worn the user.
  void onMinusOneFromCount() {
    countFromArguments.value == 1 ? AppDefaults.defaultToast(AppStrings.countCanNotBeLessThenOneToast) : countFromArguments.value--;
    totalPrice.value = countFromArguments.value * plantFromArguments.price;
  }
}
