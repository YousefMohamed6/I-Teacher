import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iteacher/core/theme/app_colors/dark_mode_colors.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: DarkModeColors.primaryColor,
      scaffoldBackgroundColor: DarkModeColors.scaffoldBackgroundColor,
      colorScheme: ColorScheme.dark(
        primary: DarkModeColors.primaryColor,
        onPrimary: DarkModeColors.onPrimaryColor,
        secondary: DarkModeColors.secondaryColor,
        onSecondary: DarkModeColors.onSecondaryColor,
        surface: DarkModeColors.surfaceColor,
        onSurface: DarkModeColors.onSurfaceColor,
        error: DarkModeColors.errorColor,
        onError: DarkModeColors.onErrorColor,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: DarkModeColors.appBarColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: DarkModeColors.onBackgroundColor),
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: DarkModeColors.onBackgroundColor,
        ),
      ),
      textTheme: GoogleFonts.cairoTextTheme().apply(
        bodyColor: DarkModeColors.onBackgroundColor,
        displayColor: DarkModeColors.onBackgroundColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DarkModeColors.primaryColor,
          foregroundColor: DarkModeColors.onPrimaryColor,
          minimumSize: Size(double.infinity, AppDimensions.kButtonHeight48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
          ),
          textStyle: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          elevation: 2,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: DarkModeColors.primaryColor,
          textStyle: GoogleFonts.cairo(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DarkModeColors.surfaceColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimensions.kPadding16,
          vertical: AppDimensions.kPadding14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
          borderSide: const BorderSide(color: DarkModeColors.secondaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
          borderSide: BorderSide(color: DarkModeColors.secondaryColor.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
          borderSide: const BorderSide(color: DarkModeColors.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
          borderSide: const BorderSide(color: DarkModeColors.errorColor),
        ),
        hintStyle: GoogleFonts.cairo(
          color: DarkModeColors.secondaryColor,
          fontSize: 14.sp,
        ),
        labelStyle: GoogleFonts.cairo(
          color: DarkModeColors.primaryColor,
          fontSize: 14.sp,
        ),
      ),
      cardTheme: CardThemeData(
        color: DarkModeColors.cardColor,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius16),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: DarkModeColors.primaryColor,
      ),
    );
