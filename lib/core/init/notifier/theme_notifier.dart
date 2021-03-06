import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/init/theme/dark_theme.dart';
import '../../../core/init/theme/light_theme.dart';
import '../../constants/enums/preferences_keys.dart';
import '../../constants/enums/theme_values_enum.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier(this._themeData);

  ThemeData _themeData;
  ThemeData get theme => _themeData;

  void toggleTheme(bool isDark) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
      PreferencesKeys.THEME.toString(),
      isDark ? ThemeValues.DARK.toString() : ThemeValues.LIGHT.toString(),
    );

    _themeData = isDark ? darkThemeData() : lightThemeData();
    notifyListeners();
  }
}
