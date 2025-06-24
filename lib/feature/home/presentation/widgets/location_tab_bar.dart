import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../domain/entities/home_entity.dart';

class LocationTabBar extends StatelessWidget {
  const LocationTabBar({super.key,required this.doctorList});

  final DoctorListEntity doctorList;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        32.verticalSpace,
        Text(
          "City",
          style: AppTextStyles.font16SemiBold(
            context,
          ).copyWith(color: AppColors.dartBlue),
        ),
        12.verticalSpace,
        Text(
          doctorList.cityEntity.nameCity,
          style: AppTextStyles.font14Regular(
            context,
          ).copyWith(color: AppColors.moreGrey),
        ),
        24.verticalSpace,
        Text(
          "Governrate",
          style: AppTextStyles.font16SemiBold(
            context,
          ).copyWith(color: AppColors.dartBlue),
        ),
        12.verticalSpace,
        Text(
          doctorList.cityEntity.governrateEntity.nameGovernrate,
          style: AppTextStyles.font14Regular(
            context,
          ).copyWith(color: AppColors.moreGrey),
        ),
      ],
    );
  }
}
