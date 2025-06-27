import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../generated/assets.dart';

class DoctorLogoAndName extends StatelessWidget {
  const DoctorLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
            Assets.svgsDoctorLogo,),
        SizedBox(
          width: 5.w,
        ),
        Text(
          "Docdoc",style: AppTextStyles.font24Bold(context).copyWith(
          color: AppColors.dartBlue
        ),
        )
      ],
    );
  }
}