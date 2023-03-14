import 'package:dztheme/states/theme_state.dart';
import 'package:dztheme/widgets/theme_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
        backgroundColor: context
            .dependOnInheritedWidgetOfExactType<ThemeWidget>()
            ?.notifier
            ?.theme
            .appBarBackground,
      ),
      backgroundColor: context
          .dependOnInheritedWidgetOfExactType<ThemeWidget>()
          ?.notifier
          ?.theme
          .backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
          child: Column(
            children: [
              Text(
                "ООП в картинках",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: context
                        .dependOnInheritedWidgetOfExactType<ThemeWidget>()
                        ?.notifier
                        ?.theme
                        .textColor),
              ),
              SizedBox(height: 6),
              Text(
                "ООП (Объектно-Ориентированное Программирование) стало неотъемлемой частью разработки многих современных проектов, но, не смотря на популярность, эта парадигма является далеко не единственной. Если вы уже умеете работать с другими парадигмами и хотели бы ознакомиться с оккультизмом ООП, то впереди вас ждет немного лонгрид и два мегабайта картинок и анимаций. В качестве примеров будут выступать трансформеры.",
                style: TextStyle(
                    color: context
                        .dependOnInheritedWidgetOfExactType<ThemeWidget>()
                        ?.notifier
                        ?.theme
                        .textColor),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.dependOnInheritedWidgetOfExactType<ThemeWidget>()?.notifier?.changeTheme();
        },
        child: Icon(Icons.nightlight_round_outlined),
        backgroundColor: context.dependOnInheritedWidgetOfExactType<ThemeWidget>()?.notifier?.theme.buttonColor,
      ),
    );
  }
}
