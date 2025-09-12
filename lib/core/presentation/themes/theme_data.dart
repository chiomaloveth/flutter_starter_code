import 'package:flutter/material.dart';
import 'package:nova/core/presentation/themes/colors.dart';
import 'package:nova/core/presentation/shared/styles/fonts.dart';


class AppThemeData {
  static lightTheme() => ThemeData(
    fontFamily: AppFont.font,
    scaffoldBackgroundColor: AppColors.kWhite,
    primaryColor: AppColors.kBrown,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.kBrown,
      secondary: AppColors.kGrey,
      error: AppColors.kError,
      onError: AppColors.kWhite,
      surface: AppColors.kWhite,
      onPrimary: AppColors.kGrey,
      onSecondary: AppColors.kBlack,
      onSurface: AppColors.kWhite,
      primaryContainer: AppColors.kGrey200,
    ),
  );
}
