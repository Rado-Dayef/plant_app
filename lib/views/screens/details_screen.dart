import 'package:plants_app/constants/app_imports.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlantModel plantFromArguments = Get.arguments;
    NavBarController navBarController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.lightGreenColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar.large(
              backgroundColor: AppColors.transparentColor,
              floating: false,
              pinned: false,
              elevation: 0,
              expandedHeight: 400.h,
              leading: Container(),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Center(
                      child: Hero(
                        tag: plantFromArguments.image,
                        child: Image.asset(
                          plantFromArguments.image,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 20.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: Get.back,
                            child: CircleAvatar(
                              backgroundColor: AppColors.secLightGreenColor,
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: AppColors.whiteColor,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => navBarController.checkAndAddToFavPlantListOrDeleteFromFavPlantList(plantFromArguments),
                            child: CircleAvatar(
                              backgroundColor: AppColors.secLightGreenColor,
                              child: Obx(
                                () {
                                  return Icon(
                                    Icons.favorite,
                                    color: plantFromArguments.isFav.value ? AppColors.redColor : AppColors.whiteColor,
                                    size: 20.sp,
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
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 290.h,
                padding: EdgeInsets.only(
                  right: 20.w,
                  bottom: 10.h,
                  left: 20.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.sp),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plantFromArguments.title,
                                style: AppFonts.font20Black.copyWith(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(
                                () {
                                  return Text(
                                    AppStrings.dollarSign + AppStrings.spaceSign + (plantFromArguments.count.value * plantFromArguments.price).toString(),
                                    style: AppFonts.font20Black.copyWith(
                                      color: AppColors.greenColor,
                                      fontSize: 24.sp,
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
                                    plantFromArguments.star.toString(),
                                    style: AppFonts.font20Black.copyWith(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(20.sp),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightGreenColor,
                                  offset: const Offset(0, 0),
                                  blurRadius: 10.sp,
                                  spreadRadius: 1.sp,
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () => navBarController.onMinusOneFromTheCountOfThePlantItem(plantFromArguments),
                                  child: Container(
                                    height: 30.sp,
                                    width: 30.sp,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.secLightGreenColor,
                                      borderRadius: BorderRadius.circular(100.sp),
                                    ),
                                    child: Text(
                                      AppStrings.minusSign,
                                      style: AppFonts.font20Black.copyWith(
                                        color: AppColors.whiteColor,
                                        fontSize: 26.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                const GapWidget(10),
                                Obx(
                                  () {
                                    return Text(
                                      plantFromArguments.count.value.toString(),
                                      style: AppFonts.font20Black.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.sp,
                                      ),
                                    );
                                  },
                                ),
                                const GapWidget(10),
                                InkWell(
                                  onTap: () => navBarController.onPlusOneToTheCountOfThePlantItem(plantFromArguments),
                                  child: Container(
                                    height: 30.sp,
                                    width: 30.sp,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.secLightGreenColor,
                                      borderRadius: BorderRadius.circular(100.sp),
                                    ),
                                    child: Text(
                                      AppStrings.plusSign,
                                      style: AppFonts.font20Black.copyWith(
                                        color: AppColors.whiteColor,
                                        fontSize: 26.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const GapWidget(15),
                      Text(
                        AppStrings.aboutPlantText,
                        style: AppFonts.font20Black.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const GapWidget(5),
                      Text(
                        AppStrings.plantDetailsText,
                        style: AppFonts.font20Black.copyWith(
                          color: AppColors.secLightGreenColor,
                          fontSize: 18,
                        ),
                      ),
                      const GapWidget(5),
                      Center(
                        child: InkWell(
                          onTap: () => navBarController.checkAndAddToCartPlantListOrDeleteFromCartPlantList(plantFromArguments),
                          child: Container(
                            height: 50.h,
                            width: 300.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.greenColor,
                              borderRadius: BorderRadius.circular(50.sp),
                            ),
                            child: Obx(
                              () {
                                return Text(
                                  plantFromArguments.inCart.value ? AppStrings.removeFromCartText : AppStrings.addToCartText,
                                  style: AppFonts.font20Black.copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const GapWidget(25),
                    ],
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
