import 'package:plants_app/constants/app_imports.dart';

class NavBarScreen extends GetWidget<NavBarController> {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: SizedBox(
            height: 130.h,
            child: Column(
              children: [
                const GapWidget(10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 5.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.sp,
                            backgroundImage: const AssetImage(AppStrings.myImage),
                          ),
                          const GapWidget(5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.welcomeText,
                                style: AppFonts.font20Black.copyWith(
                                  color: AppColors.secLightGreenColor,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Text(
                                AppStrings.radoText,
                                style: AppFonts.font20Black.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () => AppDefaults.defaultToast(AppStrings.thisFeatureIsNotAvailableToast),
                        child: const CircleAvatar(
                          backgroundColor: AppColors.lightGreenColor,
                          child: Icon(
                            Icons.notifications_none,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const GapWidget(15),
                    Icon(
                      Icons.location_on,
                      size: 16.sp,
                      color: AppColors.secLightGreenColor,
                    ),
                    Text(
                      AppStrings.cairoText + AppStrings.comaSign + AppStrings.spaceSign + AppStrings.newCairoText,
                      style: AppFonts.font20Black.copyWith(
                        color: AppColors.secLightGreenColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                const GapWidget(10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: SizedBox(
                    height: 45.sp,
                    child: TextFormField(
                      enableInteractiveSelection: false,
                      style: AppFonts.font20Black.copyWith(
                        fontSize: 14.sp,
                      ),
                      onTap: () => AppDefaults.defaultToast(AppStrings.thisFeatureIsNotAvailableToast),
                      readOnly: true,
                      cursorColor: AppColors.darkWhiteColor,
                      decoration: InputDecoration(
                        fillColor: AppColors.lightGreenColor,
                        filled: true,
                        border: AppDefaults.defaultInputBorder(),
                        errorBorder: AppDefaults.defaultInputBorder(),
                        focusedBorder: AppDefaults.defaultInputBorder(),
                        enabledBorder: AppDefaults.defaultInputBorder(),
                        disabledBorder: AppDefaults.defaultInputBorder(),
                        focusedErrorBorder: AppDefaults.defaultInputBorder(),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.darkWhiteColor,
                        ),
                        suffixIcon: const Icon(
                          Icons.filter_alt_outlined,
                          color: AppColors.darkWhiteColor,
                        ),
                        hintText: AppStrings.searchHereText,
                        hintStyle: AppFonts.font20Black.copyWith(
                          color: AppColors.darkWhiteColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(
              () {
                return controller.index.value == 1
                    ? const HomeScreen()
                    : controller.index.value == 2
                        ? const FavoriteScreen()
                        : controller.index.value == 3
                            ? const CartScreen()
                            : const ProfileScreen();
              },
            ),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.sp),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    spreadRadius: 5.sp,
                    blurRadius: 5.sp,
                    color: AppColors.secLightGreenColor,
                  ),
                ],
              ),
              child: Obx(
                () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => controller.index.value = 1,
                        child: Icon(
                          Icons.home,
                          color: controller.index.value == 1 ? AppColors.greenColor : AppColors.secLightGreenColor,
                          size: 30.sp,
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.index.value = 2,
                        child: Icon(
                          Icons.favorite,
                          color: controller.index.value == 2 ? AppColors.greenColor : AppColors.secLightGreenColor,
                          size: 30.sp,
                        ),
                      ),
                      const GapWidget(0),
                      InkWell(
                        onTap: () => controller.index.value = 3,
                        child: Icon(
                          Icons.shopping_cart_rounded,
                          color: controller.index.value == 3 ? AppColors.greenColor : AppColors.secLightGreenColor,
                          size: 30.sp,
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.index.value = 4,
                        child: Icon(
                          Icons.person,
                          color: controller.index.value == 4 ? AppColors.greenColor : AppColors.secLightGreenColor,
                          size: 30.sp,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: InkWell(
          onTap: () => AppDefaults.defaultToast(AppStrings.thisFeatureIsNotAvailableToast),
          child: CircleAvatar(
            radius: 25.sp,
            backgroundColor: AppColors.greenColor,
            child: Icon(
              Icons.qr_code_scanner_outlined,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
        ),
      ),
    );
  }
}
