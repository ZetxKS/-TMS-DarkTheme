import 'package:dztheme/states/theme_state.dart';
import 'package:dztheme/themes/custom_theme.dart';
import 'package:flutter/material.dart';

class ThemeWidget extends InheritedNotifier<ThemeState> {
  ThemeWidget({super.key, required super.child, required CustomTheme theme}): super(notifier: ThemeState(theme: theme));

  static ThemeWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeWidget>();
  }

  static ThemeWidget of(BuildContext context) {
    final theme = maybeOf(context);
    if(theme == null) {
      throw Exception('Theme not found');
    }
    return theme;
  }
}