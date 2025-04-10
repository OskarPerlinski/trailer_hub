import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Colors.blue;
  static const Color secondary = Colors.grey;
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static final Color lightBlue = Color(0xFFE1F5FE);
  static const Color purple = Colors.purple;

  static ColorScheme get colorScheme => ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.black,
    error: AppColors.error,
    onError: AppColors.black,
    surface: AppColors.white,
    onSurface: AppColors.black,
  );
}