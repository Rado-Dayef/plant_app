import 'package:plants_app/constants/app_imports.dart';

class HomePlantWidget extends StatelessWidget {
  final PlantModel plant;
  final NavBarController navBarController;

  const HomePlantWidget(
    this.plant, {
    required this.navBarController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 5.h,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGreenColor,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Hero(
                    tag: plant.image,
                    child: Image.asset(plant.image),
                  ),
                ),
                const GapWidget(5),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Text(
                    plant.title,
                    style: AppFonts.font20Black.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const GapWidget(5),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.sp,
                          horizontal: 5.sp,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        child: Text(
                          AppStrings.dollarSign + AppStrings.spaceSign + plant.price.toString(),
                          style: AppFonts.font20Black.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.thiLightGreenColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => navBarController.checkAndAddToCartPlantListOrDeleteFromCartPlantList(plant),
                        child: CircleAvatar(
                          backgroundColor: AppColors.secLightGreenColor,
                          radius: 15.sp,
                          child: Obx(
                            () {
                              return Icon(
                                plant.inCart.value ? Icons.delete_outline : Icons.add,
                                color: AppColors.whiteColor,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: InkWell(
                onTap: () => navBarController.checkAndAddToFavPlantListOrDeleteFromFavPlantList(plant),
                child: CircleAvatar(
                  radius: 15.sp,
                  backgroundColor: AppColors.secLightGreenColor,
                  child: Obx(
                    () {
                      return Icon(
                        Icons.favorite,
                        size: 18.sp,
                        color: plant.isFav.value ? AppColors.redColor : AppColors.whiteColor,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
