import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomMedicalRecordItem extends StatelessWidget {
  const CustomMedicalRecordItem({super.key,required this.title, required this.title2,required this.subtitle, required this.title3, required this.subtitle2,});

  final String title;
  final String title2;
  final String title3;
  final String subtitle;
  final String subtitle2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, style: AppTextStyles.font16SemiBold(context).copyWith(color: AppColors.dartBlue),
        ),
        24.verticalSpace,
        Row(
          children: [
            Text(
              "Feb 25", style: AppTextStyles.font14Regular(context).copyWith(color: AppColors.grey),
            ),
            24.horizontalSpace,
            Text(
              title2, style: AppTextStyles.font14Bold(context).copyWith(color: AppColors.darkBlue),
            ),
          ],
        ),
        12.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Text(
              "Feb 25", style: AppTextStyles.font14Regular(context).copyWith(color: AppColors.grey),
            ),
            24.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title3, style: AppTextStyles.font14Bold(context).copyWith(color: AppColors.darkBlue),
                ),
                8.verticalSpace,
                 Text(
                  subtitle , style: AppTextStyles.font12Medium(context).copyWith(color: AppColors.grey).copyWith(
                   height: 1.8
                 ),
                ),
              ],
            ),
          ],
        ),
        12.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Text(
              "Feb 25", style: AppTextStyles.font14Regular(context).copyWith(color: AppColors.grey),
            ),
            24.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title3, style: AppTextStyles.font14Bold(context).copyWith(color: AppColors.darkBlue),
                ),
                8.verticalSpace,
                Text(
                  subtitle2 , style: AppTextStyles.font12Medium(context).copyWith(color: AppColors.grey).copyWith(
                      height: 1.8
                ),
                ),
              ],
            ),
          ],
        ),
        32.verticalSpace,
      ],
    );
  }
}
