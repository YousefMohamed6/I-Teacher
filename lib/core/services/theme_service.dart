import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';

class ThemeService {
  static ThemeData light() => ThemeData(
        fontFamily: AppFonts.kFontHandjet,
        primaryColor: AppColors.kPrimryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.kPrimryColor,
        ),
        secondaryHeaderColor: const Color(0xFF4da2a9),
        disabledColor: const Color(0xFFBABFC4),
        brightness: Brightness.light,
        hintColor: const Color(0xFF9F9F9F),
        cardColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.03),
        textButtonTheme: TextButtonThemeData(
            style:
                TextButton.styleFrom(foregroundColor: AppColors.kPrimryColor)),
        colorScheme: const ColorScheme.light(
                primary: AppColors.kPrimryColor,
                secondary: AppColors.kPrimryColor)
            .copyWith(surface: const Color(0xFFFCFCFC))
            .copyWith(error: const Color(0xFFE84D4F)),
        popupMenuTheme: const PopupMenuThemeData(
            color: Colors.white, surfaceTintColor: Colors.white),
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500))),
        bottomAppBarTheme: const BottomAppBarTheme(
          surfaceTintColor: Colors.white,
          height: 60,
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        dividerTheme:
            const DividerThemeData(thickness: 0.2, color: Color(0xFFA0A4A8)),
        tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
      );

  static ThemeData dark() => ThemeData(
        fontFamily: AppFonts.kFontHandjet,
        primaryColor: AppColors.kPrimryColor,
        secondaryHeaderColor: const Color(0xFF4da2a9),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.kPrimryColor,
        ),
        disabledColor: const Color(0xffa2a7ad),
        brightness: Brightness.dark,
        hintColor: const Color(0xFFbebebe),
        cardColor: const Color(0xFF30313C),
        shadowColor: Colors.white.withOpacity(0.03),
        textButtonTheme: TextButtonThemeData(
            style:
                TextButton.styleFrom(foregroundColor: AppColors.kPrimryColor)),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.kPrimryColor,
          secondary: AppColors.kPrimryColor,
        )
            .copyWith(surface: const Color(0xFF191A26))
            .copyWith(error: const Color(0xFFdd3135)),
        popupMenuTheme: const PopupMenuThemeData(
            color: Color(0xFF29292D), surfaceTintColor: Color(0xFF29292D)),
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white10),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500))),
        bottomAppBarTheme: const BottomAppBarTheme(
          surfaceTintColor: Colors.black,
          height: 60,
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        dividerTheme: const DividerThemeData(
          thickness: 0.5,
          color: Color(0xFFA0A4A8),
        ),
        tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
      );
}
