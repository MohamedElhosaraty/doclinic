import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/enum_state.dart';

class CustomStepLine extends StatelessWidget {
  const CustomStepLine({super.key, required this.status});

  final StepStatus status;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1.5,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        color:
        (status == StepStatus.completed || status == StepStatus.current)
            ? AppColors.fillGreen
            : AppColors.grey300,
      ),
    );
  }
}
