import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color primaryColor = Color(0xFF247CFF);
  static const Color grey = Color(0xFF757575);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color moreGrey = Color(0xFF6F6F6F);
  static const Color dartBlue = Color(0xFF242424);
  static const Color neutral = Color(0xFFF5F5F5);
  static const Color lightBlue = Color(0xFFF4F8FF);
  static const Color lightGrey = Color(0xFFC2C2C2);
  static const Color lighterGrey = Color(0xFFEDEDED);
  static const Color moreLightGrey = Color(0xFFFDFDFF);
  static const Color moreLighterGrey = Color(0xFFF5F5F5);
  static const Color light = Color(0xFFF2F4F7);
  static const Color fillGreen = Color(0xFF22C55E);
  static const Color moreLightBlue = Color(0xFFEAF2FF);
  static const Color black = Color(0xFF212121);
  static const Color red = Color(0xFFFF4C5E);
  static const Color moreLight = Color(0xFFF8F8F8);


  static const Color lightBlue700 = Color(0xFFB2CCFF);
  static const Color darkBlue = Color(0xFF001640);
  static const Color navy = Color(0xFF51526C);
  static const Color rect = Color (0xFFB2CCFF);
  static const Color grayScale = Color (0xFF67687E);
  static const Color placeHolder = Color (0xFF929BAB);
  static const Color lightBlue900 = Color (0xFFD9E6FF);

  static const Color transparent = Colors.transparent;

  // Optional: Add a method to create a MaterialColor from a single Color
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
