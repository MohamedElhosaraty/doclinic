import 'package:doclinic/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../widgets/doctor_image_and_text.dart';
import '../widgets/doctor_logo_and_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: 30.h,
                bottom: 30.h
            ),
            child:  Column(
              children: [
                const DoctorLogoAndName(),
                30.verticalSpace,
                const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.font13Regular(context).copyWith(
                          color: AppColors.grey
                        ),
                      ),
                      30.verticalSpace,
                      CustomButton(
                        onPressed:  (){
                           context.pushReplacementNamed(Routes.loginScreen);
                        },
                        text: "Get Started",
                        yPadding: 14.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}