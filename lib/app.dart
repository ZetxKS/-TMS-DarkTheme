import 'package:dztheme/screens/home_screen.dart';
import 'package:dztheme/themes/custom_theme.dart';
import 'package:dztheme/widgets/theme_widget.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThemeWidget(theme: CustomLightTheme(), child: HomeScreen()),
    );
  }
}
