import 'package:plants_app/constants/app_imports.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.h),
          child: SizedBox(
            height: 200.h,
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
                const GapWidget(10),
                Row(
                  children: [
                    const GapWidget(15),
                    Text(
                      AppStrings.categoryText,
                      style: AppFonts.font20Black.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const GapWidget(10),
                SizedBox(
                  height: 25.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    itemCount: controller.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      CategoryModel category = controller.categories[index];
                      return InkWell(
                        onTap: index == 0 ? null : () => AppDefaults.defaultToast(AppStrings.thisFeatureIsNotAvailableToast),
                        child: HomeCategoryWidget(category),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const GapWidget(15);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: FutureBuilder<void>(
          future: controller.loadPlantData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return AppShimmers.homePlantShimmer();
            } else if (snapshot.hasError) {
              return Center(
                child: Icon(
                  Icons.error_outline,
                  color: AppColors.whiteColor,
                  size: 75.sp,
                ),
              );
            } else {
              return MasonryGridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.plantList.length,
                gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                crossAxisSpacing: 10.sp,
                mainAxisSpacing: 10.sp,
                itemBuilder: (itemBuilder, index) {
                  PlantModel plant = controller.plantList[index];
                  return InkWell(
                    onTap: () => controller.onPlantItemClick(plant),
                    child: HomePlantWidget(plant),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
