import 'package:flutter/material.dart';

abstract class CustomTheme {
  Color get textColor;
  Color get backgroundColor;
  Color get buttonColor;
  Color get appBarBackground;
}

class CustomLightTheme extends CustomTheme {
  @override
  Color get textColor => Color.fromARGB(255, 35, 35, 35);
  @override
  Color get backgroundColor => Color.fromARGB(255, 223, 223, 223);
  @override
  Color get buttonColor => Colors.green;
  @override
  Color get appBarBackground => Colors.green;
}

class CustomDarkTheme extends CustomTheme {
  @override
  Color get textColor => Color.fromARGB(255, 223, 223, 223);
  @override
  Color get backgroundColor => Color.fromARGB(255, 35, 35, 35);
  @override
  Color get buttonColor => Colors.blueAccent;
  @override
  Color get appBarBackground => Colors.blueAccent;
}