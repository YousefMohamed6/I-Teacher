import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/theme/app_colors/light_mode_colors.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';

ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      primaryColor: LightModeColors.primaryColor,
      secondaryHeaderColor: LightModeColors.secondaryColor,
      scaffoldBackgroundColor: LightModeColors.scaffoldBackbroundColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: LightModeColors.appBarColor,
        iconTheme: IconThemeData(
          color: LightModeColors.onPrimaryColor,
        ),
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontFamily: AppFonts.kPacificoFont,
          color: LightModeColors.onPrimaryColor,
        ),
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 16.sp,
            color: LightModeColors.onPrimaryColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.sp,
            color: LightModeColors.onPrimaryColor,
          ),
          bodySmall: TextStyle(
            fontSize: 12.sp,
            color: LightModeColors.onPrimaryColor,
          ),
          titleLarge: TextStyle(
            fontSize: 20.sp,
            color: LightModeColors.onPrimaryColor,
          ),
          titleMedium: TextStyle(
            fontSize: 16.sp,
            color: LightModeColors.onPrimaryColor,
          ),
          titleSmall: TextStyle(
            fontSize: 14.sp,
            color: LightModeColors.onPrimaryColor,
          ),
          labelLarge: TextStyle(
            fontSize: 20.sp,
            color: LightModeColors.onPrimaryColor,
          ),
          labelMedium: TextStyle(
            fontSize: 16.sp,
            color: LightModeColors.onPrimaryColor,
          ),
          labelSmall: TextStyle(
            fontSize: 14.sp,
            color: LightModeColors.onPrimaryColor,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightModeColors.onPrimaryColor,
          enableFeedback: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: LightModeColors.primaryColor,
            fontFamily: AppFonts.kFontLumanosimo,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: LightModeColors.primaryColor,
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: LightModeColors.primaryColor,
            fontFamily: AppFonts.kFontLumanosimo,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: LightModeColors.onPrimaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: LightModeColors.onPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: LightModeColors.onPrimaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 14.h,
        ),
        prefixIconColor: LightModeColors.onPrimaryColor,
        suffixIconColor: LightModeColors.onPrimaryColor,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          color: LightModeColors.onPrimaryColor,
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: LightModeColors.onPrimaryColor,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: LightModeColors.primaryColor,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(
          LightModeColors.primaryColor,
        ),
        checkColor: WidgetStateProperty.all(
          LightModeColors.onPrimaryColor,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(
            LightModeColors.onPrimaryColor,
          ),
        ),
      ),
    );
