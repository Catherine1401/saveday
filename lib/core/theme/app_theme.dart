import 'package:flutter/material.dart';
import 'package:saveday/core/theme/app_colors.dart';
import 'package:saveday/core/theme/app_text_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.white900,
      brightness: Brightness.light,
    ),
    textTheme: AppTextStyles.textTheme,
  );
}
