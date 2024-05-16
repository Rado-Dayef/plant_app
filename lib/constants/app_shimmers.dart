import 'dart:math';

import 'package:plants_app/constants/app_imports.dart';

class AppShimmers {
  static Widget homePlantShimmer() {
    return MasonryGridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      crossAxisSpacing: 10.sp,
      mainAxisSpacing: 10.sp,
      itemBuilder: (itemBuilder, index) {
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
                    Shimmer.fromColors(
                      baseColor: AppColors.lightGreenColor,
                      highlightColor: AppColors.greenColor,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.sp,
                        ),
                        height: Random().nextInt(200) + 150.sp,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                      ),
                    ),
                    const GapWidget(5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: Shimmer.fromColors(
                        baseColor: AppColors.lightGreenColor,
                        highlightColor: AppColors.greenColor,
                        child: Container(
                          height: 15.sp,
                          width: 50.sp,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
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
                            child: Shimmer.fromColors(
                              baseColor: AppColors.lightGreenColor,
                              highlightColor: AppColors.greenColor,
                              child: Container(
                                height: 15.sp,
                                width: 50.sp,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(5.sp),
                                ),
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: AppColors.lightGreenColor,
                            highlightColor: AppColors.greenColor,
                            child: CircleAvatar(
                              backgroundColor: AppColors.secLightGreenColor,
                              radius: 15.sp,
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
                  child: Shimmer.fromColors(
                    baseColor: AppColors.lightGreenColor,
                    highlightColor: AppColors.greenColor,
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: AppColors.secLightGreenColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
