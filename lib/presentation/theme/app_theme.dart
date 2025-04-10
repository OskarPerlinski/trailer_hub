import 'package:flutter/material.dart';
import 'package:trailer_hub/presentation/theme/app_colors.dart';
import 'package:trailer_hub/presentation/theme/app_dimens.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: AppColors.colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.transparent,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: AppDimens.l),
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.s)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.s)),
          borderSide: BorderSide(color: AppColors.primary, width: AppDimens.xs),
        ),
        hintStyle: TextStyle(color: AppColors.secondary),
      ),
    );
  }
}
