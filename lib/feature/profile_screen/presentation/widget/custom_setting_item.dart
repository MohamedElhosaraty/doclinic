import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomSettingItem extends StatelessWidget {
  const CustomSettingItem({
    super.key,
    required this.title,
    this.onPressed,
    this.isLogout = false,
    required this.imageString,
  });

  final String title;
  final String imageString;
  final void Function()? onPressed;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(imageString),
            12.horizontalSpace,
            Text(
              title,
              style: AppTextStyles.font14Regular(
                context,
              ).copyWith(color: isLogout ? AppColors.red : AppColors.darkBlue),
            ),
            Spacer(),
            IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: AppColors.darkBlue,
              ),
            ),
          ],
        ),
        Divider(thickness: 1, color: AppColors.lightGrey),
        15.verticalSpace,
      ],
    );
  }
}
