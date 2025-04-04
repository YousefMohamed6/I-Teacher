import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/theme/app_colors/dark_mode_colors.dart';
import 'package:iteacher/core/utils/constants/app_fonts.dart';

ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      primaryColor: DarkModeColors.primaryColor,
      secondaryHeaderColor: DarkModeColors.secondaryColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: DarkModeColors.appBarColor,
        iconTheme: IconThemeData(
          color: DarkModeColors.onPrimaryColor,
        ),
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontFamily: AppFonts.kPacificoFont,
          color: DarkModeColors.onPrimaryColor,
        ),
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 16.sp,
            color: DarkModeColors.onPrimaryColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.sp,
            color: DarkModeColors.onPrimaryColor,
          ),
          bodySmall: TextStyle(
            fontSize: 12.sp,
            color: DarkModeColors.onPrimaryColor,
          ),
          titleLarge: TextStyle(
            fontSize: 20.sp,
            color: DarkModeColors.onPrimaryColor,
          ),
          titleMedium: TextStyle(
            fontSize: 16.sp,
            color: DarkModeColors.onPrimaryColor,
          ),
          titleSmall: TextStyle(
            fontSize: 14.sp,
            color: DarkModeColors.onPrimaryColor,
          ),
          labelLarge: TextStyle(
            fontSize: 20.sp,
            color: DarkModeColors.onPrimaryColor,
          ),
          labelMedium: TextStyle(
            fontSize: 16.sp,
            color: DarkModeColors.onPrimaryColor,
          ),
          labelSmall: TextStyle(
            fontSize: 14.sp,
            color: DarkModeColors.onPrimaryColor,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DarkModeColors.onPrimaryColor,
          enableFeedback: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: DarkModeColors.primaryColor,
            fontFamily: AppFonts.kFontLumanosimo,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: DarkModeColors.onPrimaryColor,
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: DarkModeColors.primaryColor,
            fontFamily: AppFonts.kFontLumanosimo,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: DarkModeColors.onPrimaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: DarkModeColors.onPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: DarkModeColors.onPrimaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 14.h,
        ),
        prefixIconColor: DarkModeColors.onPrimaryColor,
        suffixIconColor: DarkModeColors.onPrimaryColor,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          color: DarkModeColors.onPrimaryColor,
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: DarkModeColors.onPrimaryColor,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: DarkModeColors.onPrimaryColor,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(
          DarkModeColors.primaryColor,
        ),
        checkColor: WidgetStateProperty.all(
          DarkModeColors.onPrimaryColor,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(
            DarkModeColors.onPrimaryColor,
          ),
        ),
      ),
    );
