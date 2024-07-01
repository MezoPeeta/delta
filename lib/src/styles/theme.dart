import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const double _borderRadius = 12;

  static ThemeData defaultTheme = ThemeData(
      colorSchemeSeed: AppColors.buttonColor,
      fontFamily: GoogleFonts.cairo().fontFamily,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_borderRadius))))),
      progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColors.buttonColor, linearTrackColor: AppColors.grayColor),
      checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: AppColors.grayColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_borderRadius))),
              foregroundColor: const WidgetStatePropertyAll<Color>(
                Colors.white,
              ),
              backgroundColor: WidgetStatePropertyAll<Color>(
                AppColors.buttonColor,
              ))),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_borderRadius))));
}
