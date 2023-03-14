import 'package:dztheme/states/theme_state.dart';
import 'package:dztheme/themes/custom_theme.dart';
import 'package:flutter/material.dart';

class ThemeWidget extends InheritedNotifier<ThemeState> {
  ThemeWidget({super.key, required super.child, required CustomTheme theme}): super(notifier: ThemeState(theme: theme));
}