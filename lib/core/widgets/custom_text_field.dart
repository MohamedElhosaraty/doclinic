import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.textController,
    this.labelText,
    this.style,
    this.validator,
    this.isObscure,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
  });

  final TextEditingController? textController;
  final String? labelText;
  final TextStyle? style;
  final bool? isObscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isObscure ?? false,
      controller: textController,
      style: style,
      decoration: InputDecoration(
        fillColor: AppColors.background,
        filled: true,
        hintText: labelText,
        hintStyle: AppTextStyles.font14Medium(context).copyWith(color: AppColors.lightGrey),
        errorStyle: AppTextStyles.font16Medium(context).copyWith(color: AppColors.lightGrey),
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.primaryColor,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.darkBlue,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide:  BorderSide(color: AppColors.lightGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide:  BorderSide(color:AppColors.lightGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      validator: validator,
    );
  }
}
