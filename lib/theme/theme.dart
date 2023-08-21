import 'package:flutter/material.dart';
import 'package:mrjoo/consts/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kPrimryColor,
  scaffoldBackgroundColor: kPrimryColor,
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
