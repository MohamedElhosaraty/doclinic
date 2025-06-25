import 'package:doclinic/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/enum_state.dart';

class CustomStepItem extends StatelessWidget {
  final int stepNumber;
  final String label;
  final StepStatus status;
  final VoidCallback onTap;

  const CustomStepItem({
    super.key,
    required this.stepNumber,
    required this.label,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color circleColor;
    Color textColor;

    switch (status) {
      case StepStatus.completed:
        circleColor = AppColors.fillGreen;
        textColor = AppColors.fillGreen;
        break;
      case StepStatus.current:
        circleColor = AppColors.primaryColor;
        textColor = AppColors.dartBlue;
        break;
      case StepStatus.inactive:
        circleColor = AppColors.grey300;
        textColor = AppColors.grey;
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: circleColor,
            child: Text(
              '$stepNumber',
              style: const TextStyle(color: AppColors.background),
            ),
          ),
        ),
        6.verticalSpace,
        Text(
          label,
          style: AppTextStyles.font12Regular(
            context,
          ).copyWith(color: textColor),
        ),
      ],
    );
  }
}
