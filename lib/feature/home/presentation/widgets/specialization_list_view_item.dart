import 'package:doclinic/core/theming/app_colors.dart';
import 'package:doclinic/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';

class SpecializationListViewItem extends StatelessWidget {
  final String nameSpecialization;
  final int itemIndex;
  final int selectedIndex;
  const SpecializationListViewItem({super.key, required this.itemIndex, required this.selectedIndex, required this.nameSpecialization});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: itemIndex == 0 ? 0 : 24.w
      ),
      child: Column(
        children: [

          itemIndex == selectedIndex ?
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.dartBlue,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.lightBlue,
              child: Image.asset(Assets.imagesHomeDoctorSpeciality,
                width: 42.w,
                height: 42.h,
              ),
            ),

          )
              :
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.lightBlue,
            child: Image.asset(Assets.imagesHomeDoctorSpeciality,
              width: 40.w,
              height: 40.h,
            ),
          ),
          8.verticalSpace,
          Text(
             nameSpecialization ,
            style: itemIndex == selectedIndex ?
            AppTextStyles.font14Bold(context).copyWith(color: AppColors.dartBlue)
                : AppTextStyles.font12Regular(context).copyWith(color: AppColors.dartBlue),
          )
        ],
      ),
    );
  }
}