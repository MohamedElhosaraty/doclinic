import 'package:doclinic/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomUpcomingItem extends StatelessWidget {
  const CustomUpcomingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey300,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: "doctorList.image",
                  errorWidget:
                      (context, url, error) => Image.network(
                        "https://img.freepik.com/premium-vector/medical-mastery-vectors-doctor-artistic-visuals-doctor-illustrations-precision-medical-graphics_772298-37437.jpg",
                        fit: BoxFit.contain,
                        width: 75.w,
                        height: 75.h,
                      ),

                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return Shimmer.fromColors(
                      baseColor: AppColors.lightGrey,
                      highlightColor: AppColors.background,
                      child: Container(
                        width: 110.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  imageBuilder:
                      (context, imageProvider) => Container(
                        width: 110.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.moreLighterGrey,
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "doctorList.nameDoctor",
                      style: AppTextStyles.font18Bold(
                        context,
                      ).copyWith(color: AppColors.dartBlue),
                      overflow: TextOverflow.ellipsis,
                    ),
                    5.verticalSpace,
                    Text(
                      "{doctorList.degree} | {doctorList.phone}",
                      style: AppTextStyles.font12Medium(
                        context,
                      ).copyWith(color: AppColors.grey),
                    ),
                    5.verticalSpace,
                    Text(
                      "doctorList.email",
                      style: AppTextStyles.font12Medium(
                        context,
                      ).copyWith(color: AppColors.grey),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: () {},
                  borderRadiusColor: AppColors.primaryColor,
                  bgColor: AppColors.background,
                  text: "Cancel Appointment",
                  textStyle: AppTextStyles.font14Medium(
                    context,
                  ).copyWith(color: AppColors.primaryColor),
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: CustomButton(
                  onPressed: () {},
                  text: "Done Appointment",
                  textStyle: AppTextStyles.font14Medium(
                    context,
                  ).copyWith(color: AppColors.background),
                ),
              ),
            ],
          ),
          28.verticalSpace,
        ],
      ),
    );
  }
}
