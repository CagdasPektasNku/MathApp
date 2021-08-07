import 'package:flutter/material.dart';
import '../theme/light_theme.dart';

import '../theme/enum/theme_enum.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLigt.instance.lightTheme;

  AppThemes _currenThemeEnum = AppThemes.LIGHT;

  AppThemes get currenThemeEnum => _currenThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  void changeTheme() {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currenThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppThemeLigt.instance.lightTheme;

      _currenThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}
