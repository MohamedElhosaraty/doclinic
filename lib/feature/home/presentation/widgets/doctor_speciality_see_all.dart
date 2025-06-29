import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key, required this.title,required this.onPressed});

  final String title ;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,style: AppTextStyles.font18SemiBold(context).copyWith(color: AppColors.dartBlue),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            "See All",style: AppTextStyles.font12Regular(context),
          ),
        ),

      ],
    );
  }
}