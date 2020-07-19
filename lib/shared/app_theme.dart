import 'package:flutter/material.dart';

import 'shared.dart';

class AppTheme {
  static ThemeData get data {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      accentColor: AppColors.primaryDark,
      buttonColor: AppColors.primaryDark,
      textTheme: _buildDefaultTextTheme(),
    );
  }

  static TextTheme _buildDefaultTextTheme() {
    return TextTheme(
      bodyText1: TextStyle(
          fontSize: 14,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w400),
      bodyText2: TextStyle(
          fontSize: 12,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w400),
      headline1: TextStyle(
          fontSize: 16,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600),
      headline2: TextStyle(
          fontSize: 14,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600),
      headline3: TextStyle(
          fontSize: 12,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600),
      button: TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
    );
  }
}
