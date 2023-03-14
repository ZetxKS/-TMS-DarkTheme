import 'package:dztheme/themes/custom_theme.dart';
import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  CustomTheme theme;

  ThemeState({required this.theme});

  changeTheme() {
    if(theme is CustomDarkTheme) {
      theme = CustomLightTheme();
    } else {
      theme = CustomDarkTheme();
    }
    notifyListeners();
  }
}