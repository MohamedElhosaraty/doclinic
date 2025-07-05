import 'package:doclinic/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0,left: 16 ,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                context.pop;
              },
              icon: const Icon(Icons.arrow_back_ios,color: AppColors.background,)),
          Text(
            "Profile", style: AppTextStyles.font18SemiBold(context).copyWith(color: AppColors.background),),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined,color: AppColors.background,)),
        ],
      ),
    );
  }
}
