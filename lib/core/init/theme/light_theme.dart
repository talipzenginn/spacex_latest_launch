import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData.light().copyWith(
    // scaffoldBackgroundColor: const Color(0xff180F24),
    appBarTheme: const AppBarTheme(
      color: Color(0xff000001),
    ),
    textTheme: const TextTheme(
      headline5: TextStyle(color: Color(0xff202124)),
      subtitle1: TextStyle(color: Colors.black87),
      button: TextStyle(color: Colors.white),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color(0xff000034),
      secondary: Colors.grey,
      tertiary: const Color(0XFFE8E9ED),
      background: Colors.white,
    ),
  );
}
