import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';



class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller
  });

  final Function(String)? onChanged;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText ?? "Search",
        hintStyle: AppTextStyles.poppins16LightMedium(context).copyWith(
          color: AppColors.lightGrey,
        ),
        fillColor: AppColors.neutral,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide:  BorderSide(color: AppColors.moreLighterGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide:  BorderSide(color: AppColors.moreLighterGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide:  BorderSide(color: AppColors.moreLighterGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide:  BorderSide(color: AppColors.moreLighterGrey),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        prefixIcon: prefixIcon ??
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                Assets.svgsSearchIcon,
                width: 24,
                height: 24,
              ),
            ),
        // suffixIcon: suffixIcon ??
        //     Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: SvgPicture.asset(
        //         'Assets.svgFilterIcon',
        //         width: 24,
        //         height: 24,
        //       ),
        //     ),
      ),
    );
  }
}
