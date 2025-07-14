import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinflix/core/theme/color_scheme.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.red,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: AppColors.white,
      barBackgroundColor: AppColors.background,
    ),

    fontFamily: 'EuclidCircularA',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: AppTextStyles.title,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.headingLarge,
      displayMedium: AppTextStyles.headingMedium,
      titleMedium: AppTextStyles.body,
      bodyMedium: AppTextStyles.body,
      labelLarge: AppTextStyles.button,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 0,
        textStyle: AppTextStyles.button,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: AppTextStyles.hint,
    ),
  );
}
