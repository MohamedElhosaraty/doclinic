import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class AppointmentAppBar extends StatelessWidget {
  const AppointmentAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: AppColors.lightGrey, width: .5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: AppColors.darkBlue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Text(
          "My Appointment",
          style: AppTextStyles.font18SemiBold(
            context,
          ).copyWith(color: AppColors.dartBlue),
        ),
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: AppColors.lightGrey, width: .5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(Icons.search, size: 30, color: AppColors.darkBlue),
        ),
      ],
    );
  }
}
