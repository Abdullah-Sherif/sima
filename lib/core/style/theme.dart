import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: CustomColors.offWhite,
      fontFamily: GoogleFonts.ubuntu().fontFamily,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: CustomColors.white,
        hintStyle: TextStyle(
          color: CustomColors.charcoal,
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            CustomColors.charcoal,
          ),
          textStyle: MaterialStatePropertyAll(
            TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColors.white),
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: CustomColors.charcoal,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
        titleMedium: TextStyle(
          color: CustomColors.charcoal,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        bodyLarge: TextStyle(
          color: CustomColors.charcoal,
        ),
        bodyMedium: TextStyle(
          color: CustomColors.charcoal,
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          color: CustomColors.charcoal,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: CustomColors.charcoal,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.175,
        ),
        labelSmall: TextStyle(
          color: CustomColors.charcoal,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
              brightness: Brightness.light,
              primarySwatch: Colors.grey,
              accentColor: CustomColors.charcoal,
              backgroundColor: CustomColors.offWhite)
          .copyWith(error: const Color(0xFFFF0000)),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: CustomColors.veryDarkGrey,
      fontFamily: GoogleFonts.ubuntu().fontFamily,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: CustomColors.white,
        hintStyle: TextStyle(
          color: CustomColors.charcoal,
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            CustomColors.lightBlue,
          ),
          textStyle: MaterialStatePropertyAll(
            TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColors.white),
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.175,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        accentColor: CustomColors.lightBlue,
      ).copyWith(error: const Color(0xFFFF0000)),
    );
  }
}
