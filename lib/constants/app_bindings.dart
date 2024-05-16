import 'package:plants_app/constants/app_imports.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => DetailsController(),
      fenix: true,
    );
  }
}
