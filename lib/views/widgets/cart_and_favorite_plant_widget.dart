import 'package:plants_app/constants/app_imports.dart';

class CartAndFavoritePlantWidget extends StatelessWidget {
  final Widget? cartWidgets;
  final PlantModel plant;

  const CartAndFavoritePlantWidget(
    this.plant, {
    this.cartWidgets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NavBarController navBarController = Get.find();
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: AppColors.lightGreenColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.secLightGreenColor,
            offset: const Offset(0, 0),
            blurRadius: 8.sp,
            spreadRadius: 2.sp,
          ),
        ],
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 100.sp,
                width: 100.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Hero(
                  tag: plant.image,
                  child: Image.asset(
                    plant.image,
                  ),
                ),
              ),
              const GapWidget(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.title,
                    style: AppFonts.font20Black.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  cartWidgets == null
                      ? Text(
                          AppStrings.dollarSign + AppStrings.spaceSign + plant.price.toString(),
                          style: AppFonts.font20Black.copyWith(
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Obx(
                          () {
                            return Text(
                              AppStrings.dollarSign + AppStrings.spaceSign + (plant.count.value * plant.price).toString(),
                              style: AppFonts.font20Black.copyWith(
                                color: AppColors.greenColor,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: AppColors.yellowColor,
                        size: 20.sp,
                      ),
                      const GapWidget(5),
                      Text(
                        plant.star.toString(),
                        style: AppFonts.font20Black.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          cartWidgets ??
              InkWell(
                onTap: () => navBarController.checkAndAddToFavPlantListOrDeleteFromFavPlantList(plant),
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  child: Obx(
                    () {
                      return Icon(
                        Icons.favorite,
                        size: 20.sp,
                        color: plant.isFav.value ? AppColors.redColor : AppColors.whiteColor,
                      );
                    },
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
