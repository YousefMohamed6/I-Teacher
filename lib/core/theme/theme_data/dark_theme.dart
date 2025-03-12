import 'package:flutter/material.dart';
import 'package:mrjoo/core/theme/app_colors/dark_mode_colors.dart';

ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      primaryColor: DarkModeColors.primaryColor,
      secondaryHeaderColor: DarkModeColors.secondaryColor,
    );
