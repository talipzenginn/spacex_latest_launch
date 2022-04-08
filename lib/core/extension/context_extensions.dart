import 'package:flutter/material.dart';

class ContextExtensions {}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double dynamicHeight(double _height) => height * _height;
  double dynamicWidth(double _width) => width * _width;
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}
