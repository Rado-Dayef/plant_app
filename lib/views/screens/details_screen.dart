import 'package:plants_app/constants/app_imports.dart';

class DetailsScreen extends GetWidget<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        tag: controller.plantFromArguments.image,
                        child: Image.asset(
                          controller.plantFromArguments.image,
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
                            onTap: () => AppDefaults.defaultToast(AppStrings.thisFeatureIsNotAvailableToast),
                            child: CircleAvatar(
                              backgroundColor: AppColors.secLightGreenColor,
                              child: Icon(
                                Icons.favorite,
                                color: controller.plantFromArguments.isFav ? AppColors.redColor : AppColors.whiteColor,
                                size: 20.sp,
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
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
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
                                controller.plantFromArguments.title,
                                style: AppFonts.font20Black.copyWith(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(
                                () {
                                  return Text(
                                    AppStrings.dollarSign + AppStrings.spaceSign + controller.totalPrice.value.toString(),
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
                                    controller.plantFromArguments.star.toString(),
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
                                  onTap: controller.onMinusOneFromCount,
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
                                      controller.count.value.toString(),
                                      style: AppFonts.font20Black.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.sp,
                                      ),
                                    );
                                  },
                                ),
                                const GapWidget(10),
                                InkWell(
                                  onTap: controller.onPlusOneToCount,
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
                        child: Container(
                          height: 50.h,
                          width: 300.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(50.sp),
                          ),
                          child: Text(
                            AppStrings.buyNowText,
                            style: AppFonts.font20Black.copyWith(
                              color: AppColors.whiteColor,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
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
