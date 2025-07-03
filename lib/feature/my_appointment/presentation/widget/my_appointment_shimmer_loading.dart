import 'package:doclinic/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyAppointmentShimmerLoading extends StatelessWidget {
  const MyAppointmentShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        child: Shimmer.fromColors(
          baseColor: AppColors.lightGrey,
          highlightColor: AppColors.background,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 75.w,
                    height: 75.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 18.h,
                          width: 140.w,
                          color: Colors.white,
                        ),
                        8.verticalSpace,
                        Container(
                          height: 14.h,
                          width: 100.w,
                          color: Colors.white,
                        ),
                        8.verticalSpace,
                        Container(
                          height: 14.h,
                          width: 120.w,
                          color: Colors.white,
                        ),
                        8.verticalSpace,
                        Container(
                          height: 14.h,
                          width: 120.w,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Divider(color: AppColors.lightGrey, thickness: 1),
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Container(
                      height: 45.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
