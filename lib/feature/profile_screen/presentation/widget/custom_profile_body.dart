import 'package:doclinic/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../generated/assets.dart';

class CustomProfileBody extends StatelessWidget {
  const CustomProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          34.verticalSpace,
          Container(
            width: 140.w,
            height: 140.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
            ),
            child: Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.background,
              ),
              child: ClipOval(
                child: Image.asset(
                  Assets.imagesProfile,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          32.verticalSpace,
          Text(
            "Mohammed Elhosaraty",
            style: AppTextStyles.font20SemiBold(context).copyWith(
              color: AppColors.black,
            ),
          ),
          12.verticalSpace,
          Text(
            "mohammedelhosaraty@gmail.com",
            style: AppTextStyles.font14Regular(context).copyWith(
              color: AppColors.moreGrey,
            ),
          ),
          24.verticalSpace,
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.moreLight,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    context.pushNamed(Routes.myAppointmentScreen);
                  },
                  child: Text(
                    "My Appointment",
                    style: AppTextStyles.font12Regular(context).copyWith(
                      color: AppColors.dartBlue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: VerticalDivider(
                    color: AppColors.grey300,
                    thickness: 2,
                  ),
                ),

                Text(
                  "Medical records",
                  style: AppTextStyles.font12Regular(context).copyWith(
                    color: AppColors.dartBlue,
                  ),
                ),
              ],
            ),
          ),
          24.verticalSpace,
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.moreLightBlue,
                child: SvgPicture.asset(
                  Assets.svgsPersonalInformation,
                ),
              ),
              12.horizontalSpace,
              Text(
                "Personal Information",
                style: AppTextStyles.font14Regular(context).copyWith(
                  color: AppColors.dartBlue,
                ),
              ),
            ],
          ),
          5.verticalSpace,
          Divider(
            color: AppColors.grey300,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
