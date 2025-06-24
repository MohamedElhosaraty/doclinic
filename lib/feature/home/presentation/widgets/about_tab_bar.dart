import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../domain/entities/home_entity.dart';

class AboutTabBar extends StatelessWidget {
  const AboutTabBar({super.key, required this.doctorList});

  final DoctorListEntity doctorList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        32.verticalSpace,
        Text(
          "About me",
          style: AppTextStyles.font16SemiBold(
            context,
          ).copyWith(color: AppColors.dartBlue),
        ),
        12.verticalSpace,
        Text(
          doctorList.description,
          style: AppTextStyles.font14Regular(
            context,
          ).copyWith(color: AppColors.moreGrey),
        ),
        24.verticalSpace,
        Text(
          "Start Working Time",
          style: AppTextStyles.font16SemiBold(
            context,
          ).copyWith(color: AppColors.dartBlue),
        ),
        12.verticalSpace,
        Text(
          doctorList.startTime.replaceFirst(":00", ""),
          style: AppTextStyles.font14Regular(
            context,
          ).copyWith(color: AppColors.moreGrey),
        ),
        24.verticalSpace,
        Text(
          "Finish Working Time",
          style: AppTextStyles.font16SemiBold(
            context,
          ).copyWith(color: AppColors.dartBlue),
        ),
        12.verticalSpace,
        Text(
          doctorList.endTime.replaceFirst(":00", ""),
          style: AppTextStyles.font14Regular(
            context,
          ).copyWith(color: AppColors.moreGrey),
        ),
        24.verticalSpace,
        Text(
          "Gender",
          style: AppTextStyles.font16SemiBold(
            context,
          ).copyWith(color: AppColors.dartBlue),
        ),
        12.verticalSpace,
        Text(
          doctorList.gender,
          style: AppTextStyles.font14Regular(
            context,
          ).copyWith(color: AppColors.moreGrey),
        ),
      ],
    );
  }
}
