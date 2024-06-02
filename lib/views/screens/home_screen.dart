import 'package:plants_app/constants/app_imports.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: 45.h,
      ),
      child: Column(
        children: [
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
          MasonryGridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.navBarController.plantList.length,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            crossAxisSpacing: 10.sp,
            mainAxisSpacing: 10.sp,
            itemBuilder: (itemBuilder, index) {
              PlantModel plant = controller.navBarController.plantList[index];
              return InkWell(
                onTap: () => controller.navBarController.onPlantItemClick(plant),
                child: HomePlantWidget(
                  plant,
                  navBarController: controller.navBarController,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
