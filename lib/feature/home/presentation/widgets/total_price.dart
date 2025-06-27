import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment:   CrossAxisAlignment.start,
      children: [
        Text(
          "Total Price",style: AppTextStyles.font18Bold(context).copyWith(
            color:AppColors.dartBlue ),
        ),
        Text(
          "$price \$",style: AppTextStyles.font18Bold(context).copyWith(color: AppColors.grey),
        ),
      ],);
  }
}
