import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: AppTextStyles.font13Regular(
              context,
            ).copyWith(color: AppColors.grey),
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: AppTextStyles.font13Medium(
              context,
            ).copyWith(color: AppColors.dartBlue),
          ),
          TextSpan(
            text: ' and',
            style: AppTextStyles.font13Regular(
              context,
            ).copyWith(color: AppColors.grey, height: 1.5),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: AppTextStyles.font13Medium(
              context,
            ).copyWith(color: AppColors.dartBlue),
          ),
        ],
      ),
    );
  }
}
