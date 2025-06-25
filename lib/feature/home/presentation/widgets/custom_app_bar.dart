import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title,this.isActionButton = false, this.onPressed});

  final String title;
  final bool isActionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: isActionButton
          ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: AppColors.lightGrey, width: .5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: AppColors.darkBlue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left:isActionButton ? 0 : MediaQuery.of(context).size.width * .15),
          child: Text(
            title,
            style: AppTextStyles.font18SemiBold(
              context,
            ).copyWith(color: AppColors.block),
          ),
        ),
        isActionButton ? Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: AppColors.lightGrey, width: .5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            icon: Icon(
              Icons.more_horiz,
              size: 30,
              color: AppColors.darkBlue,
            ),
            onPressed: onPressed,
          ),
        ) : const Spacer(),

      ],
    );
  }
}
