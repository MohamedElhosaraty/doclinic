import 'package:doclinic/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../generated/assets.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Omar!",style: AppTextStyles.font18Bold(context).copyWith(
              color: AppColors.dartBlue
            ),
            ),
            Text(
              "How Are you Today?",style: AppTextStyles.font12Regular(context).copyWith(
              color: AppColors.grey
            ),
            ),

          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.moreLighterGrey,
          child: SvgPicture.asset(Assets.svgsNotification),
        ),
      ],
    );
  }
}