import 'package:plants_app/constants/app_imports.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController navBarController = Get.find();
    return Obx(
      () {
        return navBarController.favPlantList.isEmpty
            ? Center(
                child: Text(
                  AppStrings.noFavoriteItemsYetText,
                  style: AppFonts.font20Black.copyWith(
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.only(
                  top: 10.h,
                  right: 10.w,
                  bottom: 45.h,
                  left: 10.w,
                ),
                itemCount: navBarController.favPlantList.length,
                itemBuilder: (BuildContext context, int index) {
                  PlantModel plant = navBarController.favPlantList[index];
                  return InkWell(
                    onTap: () => Get.toNamed(
                      AppStrings.detailsRoute,
                      arguments: plant,
                    ),
                    child: CartAndFavoritePlantWidget(plant),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const GapWidget(15);
                },
              );
      },
    );
  }
}
