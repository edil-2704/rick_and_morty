import 'package:flutter/material.dart';
import 'package:rick_and_morty/internal/constants/theme_helper/app_colors.dart';

abstract class TextHelper {
  static TextStyle mainChar = const TextStyle(
    color: AppColors.mainBlack,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mainCharInfo = const TextStyle(
    color: AppColors.mainBlack,
    fontSize: 34,
    fontWeight: FontWeight.w400,
  );
   static TextStyle totalChar = const TextStyle(
    color: AppColors.mainGrey,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static TextStyle mainCharStatus = const TextStyle(
    color: AppColors.mainGreen,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  static TextStyle mainCharGender = const TextStyle(
    color: AppColors.mainGrey,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  static TextStyle normal14 = const TextStyle(
    color: AppColors.mainBlack,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}
