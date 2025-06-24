import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../domain/entities/home_entity.dart';

class PriceTabBar extends StatelessWidget {
  const PriceTabBar({super.key, required this.doctorList});

  final DoctorListEntity doctorList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        32.verticalSpace,
        Text(
          "Price",
          style: AppTextStyles.font16SemiBold(
            context,
          ).copyWith(color: AppColors.dartBlue),
        ),
        12.verticalSpace,
        Text(
          "${doctorList.price} \$",
          style: AppTextStyles.font14Regular(
            context,
          ).copyWith(color: AppColors.moreGrey),
        ),
        24.verticalSpace,
        Text(
          "Degree",
          style: AppTextStyles.font16SemiBold(
            context,
          ).copyWith(color: AppColors.dartBlue),
        ),
        12.verticalSpace,
        Text(
          doctorList.degree,
          style: AppTextStyles.font14Regular(
            context,
          ).copyWith(color: AppColors.moreGrey),
        ),
      ],
    );
  }
}
