import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase, context),
        2.verticalSpace,
        buildValidationRow('At least 1 uppercase letter', hasUpperCase, context),
        2.verticalSpace,
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters, context),
        2.verticalSpace,
        buildValidationRow('At least 1 number', hasNumber, context),
        2.verticalSpace,
        buildValidationRow('At least 8 characters long', hasMinLength, context),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated, BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.grey,
        ),
        6.horizontalSpace,
        Text(
          text,
          style: AppTextStyles.font13Regular(context).copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.grey : AppColors.dartBlue,
          ),
        )
      ],
    );
  }
}