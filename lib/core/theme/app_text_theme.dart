import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextTheme {
  static final lightTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
    bodyLarge: const TextStyle(
      color: AppColors.lightText,
      fontSize: 18,
    ),
    bodyMedium: const TextStyle(
      color: AppColors.lightText,
      fontSize: 14,
    ),
    bodySmall: const TextStyle(
      color: AppColors.lightText,
      fontSize: 12,
    ),
  );

  static final darkTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
    bodyLarge: const TextStyle(
      color: AppColors.darkText,
      fontSize: 18,
    ),
    bodyMedium: const TextStyle(
      color: AppColors.darkText,
      fontSize: 14,
    ),
    bodySmall: const TextStyle(
      color: AppColors.darkText,
      fontSize: 12,
    ),
  );
}
