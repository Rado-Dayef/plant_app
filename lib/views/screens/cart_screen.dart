import 'package:plants_app/constants/app_imports.dart';

class CartScreen extends GetWidget<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGreenColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 15.h,
            right: 20.w,
            bottom: 100.h,
            left: 20.w,
          ),
          child: Column(
            children: [
              Row(
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
                  const GapWidget(10),
                  Text(
                    AppStrings.cartText,
                    style: AppFonts.font20Black.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const GapWidget(20),
              Container(
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
                            tag: controller.plantFromArguments.image,
                            child: Image.asset(
                              controller.plantFromArguments.image,
                            ),
                          ),
                        ),
                        const GapWidget(20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.plantFromArguments.title,
                              style: AppFonts.font20Black.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Obx(
                              () {
                                return Text(
                                  AppStrings.dollarSign + AppStrings.spaceSign + controller.totalPrice.value.toString(),
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
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: controller.onMinusOneFromCount,
                          child: Container(
                            height: 40.sp,
                            width: 40.sp,
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.minusSign,
                              style: AppFonts.font20Black.copyWith(
                                fontSize: 30.sp,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () {
                            return Text(
                              controller.countFromArguments.value.toString(),
                              style: AppFonts.font20Black.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                              ),
                            );
                          },
                        ),
                        InkWell(
                          onTap: controller.onPlusOneToCount,
                          child: Container(
                            height: 40.sp,
                            width: 40.sp,
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.plusSign,
                              style: AppFonts.font20Black.copyWith(
                                fontSize: 30.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const GapWidget(25),
              InkWell(
                onTap: () => AppDefaults.defaultToast(AppStrings.thisFeatureIsNotAvailableToast),
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
            ],
          ),
        ),
      ),
    );
  }
}
