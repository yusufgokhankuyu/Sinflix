import 'package:flutter/material.dart';
import 'package:sinflix/core/theme/color_scheme.dart';

class AppTextStyles {
  static const TextStyle headingLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static const TextStyle title = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );

  static const TextStyle homeMovieTitle = TextStyle(
    fontSize: 18,
    color: AppColors.text,
    fontWeight: FontWeight.w600,
  );

  static TextStyle homeMoviePlot = TextStyle(
    fontSize: 13,
    color: AppColors.text75,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle authTitle = TextStyle(
    fontSize: 18,
    color: AppColors.text,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle authDescription = TextStyle(
    fontSize: 13,
    color: AppColors.text,
    fontWeight: FontWeight.w400,
  );

  static TextStyle profileID = TextStyle(
    fontSize: 12,
    color: AppColors.text20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body = TextStyle(fontSize: 16, color: AppColors.text);

  static TextStyle button = TextStyle(
    fontFamily: 'EuclidCircularA',
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );

  static const TextStyle hint = TextStyle(
    fontSize: 14,
    color: AppColors.mutedText,
  );
}
