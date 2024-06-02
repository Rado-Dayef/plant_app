import 'package:plants_app/constants/app_imports.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(
      name: AppStrings.navBarRoute,
      page: () => const NavBarScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppStrings.detailsRoute,
      page: () => const DetailsScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
