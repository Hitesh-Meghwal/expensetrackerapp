import 'package:expensetrackerapp/core/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.secondaryColor),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        headlineSmall: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.montserrat(
          fontSize: 18,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.montserrat(
          fontSize: 16,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.montserrat(
          fontSize: 14,
          color: Colors.grey,
        ),
      ));
}
