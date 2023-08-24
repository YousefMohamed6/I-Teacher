import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight());
  bool isDark = false;
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.lightGreen,
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      centerTitle: true,
    ),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    buttonTheme: const ButtonThemeData(buttonColor: Colors.black),
  );
  void changeTheme() {
    isDark ? emit(ThemeDark()) : emit(ThemeLight());
    isDark = !isDark;
  }
}
