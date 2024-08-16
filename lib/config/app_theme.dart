import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final theme = ThemeData.light();
    return theme.copyWith(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      cardTheme: theme.cardTheme.copyWith(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        color: Colors.white,
      ),
      textTheme: theme.textTheme.apply(
        displayColor: AppColors.black54,
        bodyColor: AppColors.black54,
      ),
    );
  }
}
