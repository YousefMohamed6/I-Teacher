import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iteacher/core/theme/app_colors/light_mode_colors.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: LightModeColors.primaryColor,
      scaffoldBackgroundColor: LightModeColors.scaffoldBackbroundColor,
      colorScheme: ColorScheme.light(
        primary: LightModeColors.primaryColor,
        onPrimary: LightModeColors.onPrimaryColor,
        secondary: LightModeColors.secondaryColor,
        onSecondary: LightModeColors.onSecondaryColor,
        surface: LightModeColors.surfaceColor,
        onSurface: LightModeColors.onSurfaceColor,
        error: LightModeColors.errorColor,
        onError: LightModeColors.onErrorColor,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: LightModeColors.appBarColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: LightModeColors.onPrimaryColor),
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: LightModeColors.onPrimaryColor,
        ),
      ),
      textTheme: GoogleFonts.cairoTextTheme().apply(
        bodyColor: LightModeColors.onBackgroundColor,
        displayColor: LightModeColors.onBackgroundColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightModeColors.primaryColor,
          foregroundColor: LightModeColors.onPrimaryColor,
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
          foregroundColor: LightModeColors.primaryColor,
          textStyle: GoogleFonts.cairo(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: LightModeColors.surfaceColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimensions.kPadding16,
          vertical: AppDimensions.kPadding14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
          borderSide: const BorderSide(color: LightModeColors.secondaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
          borderSide: BorderSide(color: LightModeColors.secondaryColor.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
          borderSide: const BorderSide(color: LightModeColors.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
          borderSide: const BorderSide(color: LightModeColors.errorColor),
        ),
        hintStyle: GoogleFonts.cairo(
          color: LightModeColors.secondaryColor,
          fontSize: 14.sp,
        ),
        labelStyle: GoogleFonts.cairo(
          color: LightModeColors.primaryColor,
          fontSize: 14.sp,
        ),
      ),
      cardTheme: CardThemeData(
        color: LightModeColors.cardColor,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius16),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: LightModeColors.primaryColor,
      ),
    );
