import 'package:flutter/material.dart';

ThemeData darkThemeData() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff1A1A1A),
    appBarTheme: const AppBarTheme(
      color: Color(0xff000001),
    ),
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white70),
      button: TextStyle(color: Colors.white),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: const Color(0xff7303EB),
      secondary: const Color(0xff489D89),
      tertiary: const Color(0xff37294A),
      background: Colors.white,
    ),
  );
}
