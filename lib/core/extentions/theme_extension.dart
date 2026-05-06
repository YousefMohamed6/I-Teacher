import 'package:flutter/material.dart';
import 'package:iteacher/core/theme/app_colors/dark_mode_colors.dart';
import 'package:iteacher/core/theme/app_colors/light_mode_colors.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  
  bool get isDarkMode => theme.brightness == Brightness.dark;

  Color get chatSenderColor => isDarkMode ? DarkModeColors.chatSenderColor : LightModeColors.chatSenderColor;
  Color get chatReceiverColor => isDarkMode ? DarkModeColors.chatReceiverColor : LightModeColors.chatReceiverColor;
}
