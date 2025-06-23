import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_font_weights.dart';
import 'app_text_size.dart';

class AppTextStyles {
  static const Color textColor =
      AppColors.primaryColor; // Assuming you still need AppColors

  static String getFontFamily(String fontFamily) {

    return fontFamily;
  }

  // Base style to reuse common properties
  static TextStyle baseStyle({
    required FontWeight fontWeight,
    required double fontSize,
    FontStyle? fontStyle,
    BuildContext? context, // Add context
  }) {

    return TextStyle(
      color: textColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
    );
  }

  static TextStyle font14Bold(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightBold,
    fontSize: AppTextSizes.fontSize14,
    fontStyle: FontStyle.normal,
    context: context,
  );
  static TextStyle font24Bold(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightBold,
    fontSize: AppTextSizes.fontSize24,
    fontStyle: FontStyle.normal,
    context: context,
  );


  static TextStyle font32Bold(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightBold,
    fontSize: AppTextSizes.fontSize24,
    fontStyle: FontStyle.normal,
    context: context,
  );
  static TextStyle font18Bold(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightBold,
    fontSize: AppTextSizes.fontSize18,
    fontStyle: FontStyle.normal,
    context: context,
  );

  static TextStyle font14Regular(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightRegular,
    fontSize: AppTextSizes.fontSize14,
    fontStyle: FontStyle.normal,
    context: context,
  );
  static TextStyle font10Regular(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightRegular,
    fontSize: AppTextSizes.fontSize10,
    fontStyle: FontStyle.normal,
    context: context,
  );
  static TextStyle font12Medium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize12,
    fontStyle: FontStyle.normal,
    context: context,
  );
  static TextStyle font14Medium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize14,
    fontStyle: FontStyle.normal,
    context: context,
  );
  static TextStyle font16Medium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize16,
    fontStyle: FontStyle.normal,
    context: context,
  );
  static TextStyle font18Medium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize18,
    fontStyle: FontStyle.normal,
    context: context,
  );
  static TextStyle font12Regular(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightRegular,
    fontSize: AppTextSizes.fontSize12,
    fontStyle: FontStyle.normal,
    context: context,
  );


  static TextStyle font16SemiBold(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightSemiBold,
    fontSize: AppTextSizes.fontSize16,
    fontStyle: FontStyle.normal,
    context: context,
  );
  static TextStyle font18SemiBold(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightSemiBold,
    fontSize: AppTextSizes.fontSize18,
    fontStyle: FontStyle.normal,
    context: context,
  );


  static TextStyle font13Regular(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightRegular,
    fontSize: AppTextSizes.fontSize13,
    fontStyle: FontStyle.normal,
    context: context,
  );

  static TextStyle font13Medium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize13,
    fontStyle: FontStyle.normal,
    context: context,
  );
  static TextStyle font13SemiBold(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightSemiBold,
    fontSize: AppTextSizes.fontSize13,
    fontStyle: FontStyle.normal,
    context: context,
  );



  static TextStyle poppins16Medium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize16,
    fontStyle: FontStyle.italic,
    context: context,
  );
  static TextStyle poppins16LightMedium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightLightMedium,
    fontSize: AppTextSizes.fontSize16,
    fontStyle: FontStyle.italic,
    context: context,
  );

  static TextStyle poppins12Medium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize12,
    fontStyle: FontStyle.italic,
    context: context,
  );
  static TextStyle poppins18Medium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize18,
    fontStyle: FontStyle.italic,
    context: context,
  );




  static TextStyle poppins12LightMedium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightLightMedium,
    fontSize: AppTextSizes.fontSize12,
    fontStyle: FontStyle.italic,
    context: context,
  );

  static TextStyle poppins14Medium(BuildContext context) => baseStyle(
    fontWeight: AppFontWeights.fontWeightMedium,
    fontSize: AppTextSizes.fontSize14,
    fontStyle: FontStyle.italic,
    context: context,
  );







}
