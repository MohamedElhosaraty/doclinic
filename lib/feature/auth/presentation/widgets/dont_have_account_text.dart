import 'package:doclinic/core/helpers/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../core/routing/routes.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: AppTextStyles.font13Regular(context).copyWith(
                color: AppColors.dartBlue
              ),
            ),
            TextSpan(
              text: ' Sign Up',
              style: AppTextStyles.font13SemiBold(context),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.signUpScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}