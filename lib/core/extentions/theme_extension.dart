import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  
  bool get isDarkMode => theme.brightness == Brightness.dark;

  Color get chatSenderColor => isDarkMode ? const Color(0xFF1B97F3) : const Color(0xFF1B97F3);
  Color get chatReceiverColor => isDarkMode ? const Color(0xFF424242) : const Color(0xFFE8E8EE);
}
