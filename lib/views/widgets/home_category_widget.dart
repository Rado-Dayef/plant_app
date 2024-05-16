import 'package:plants_app/constants/app_imports.dart';

class HomeCategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const HomeCategoryWidget(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 15.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(
          color: category.isSelected ? AppColors.greenColor : AppColors.secLightGreenColor,
        ),
        color: category.isSelected ? AppColors.greenColor : AppColors.whiteColor,
      ),
      child: Text(
        category.title,
        style: AppFonts.font20Black.copyWith(
          color: category.isSelected ? AppColors.whiteColor : AppColors.secLightGreenColor,
          fontSize: 18.sp,
          fontWeight: category.isSelected ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
