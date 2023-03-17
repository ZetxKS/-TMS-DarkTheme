import 'package:dztheme/states/theme_state.dart';
import 'package:dztheme/widgets/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:string_validator/string_validator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
        backgroundColor: ThemeWidget.of(context).notifier?.theme.appBarBackground,
      ),
      backgroundColor: ThemeWidget.of(context).notifier?.theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Регистрация",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ThemeWidget.of(context).notifier?.theme.textColor),
              ),
              FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'email',
                        validator: (value) {
                          if (!isEmail(value ?? "")) {
                            return "Введите валидный e-mail";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'example@simple.ru',
                          hintStyle: TextStyle(color: ThemeWidget.of(context).notifier?.theme.textColor),
                          border: UnderlineInputBorder(borderSide: BorderSide(color: ThemeWidget.of(context).notifier!.theme.buttonColor)),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeWidget.of(context).notifier!.theme.buttonColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeWidget.of(context).notifier!.theme.buttonColor)),
                        ),
                        style: TextStyle(color: ThemeWidget.of(context).notifier?.theme.textColor),
                      ),
                      FormBuilderTextField(
                        name: 'password',
                        obscureText: true,
                        validator: (value) {
                          value = value ?? '';
                          if(value.length < 6)
                            return "Пароль должен быть более 6 символов";
                          
                          final uppercase = RegExp(r'([A-Z])');
                          final specialChars = RegExp(r'([^\s\w\d])');
                          final letter = RegExp(r'([A-z])');
                          final numbers = RegExp(r'([0-9])');
                          final cyrilicLetter = RegExp(r'[А-я]');
                          
                          if(cyrilicLetter.hasMatch(value))
                            return "В пароле не должно быть русских символов";

                          if(!uppercase.hasMatch(value))
                            return "В пароле должны быть заглавные буквы";

                          if(!specialChars.hasMatch(value))
                            return "В пароле должны быть спецсимволы";

                          if(!letter.hasMatch(value))
                            return "В пароле должны быть латинские буквы";

                          if(!numbers.hasMatch(value))
                            return "В пароле должны быть цифры";
                        },
                        decoration: InputDecoration(
                          hintText: "Пароль",
                          hintStyle: TextStyle(color: ThemeWidget.of(context).notifier?.theme.textColor),
                          border: UnderlineInputBorder(borderSide: BorderSide(color: ThemeWidget.of(context).notifier!.theme.buttonColor)),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeWidget.of(context).notifier!.theme.buttonColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeWidget.of(context).notifier!.theme.buttonColor)),
                        ),
                        style: TextStyle(color: ThemeWidget.of(context).notifier?.theme.textColor),
                      ),
                      FormBuilderTextField(
                        name: 'subpassword',
                        obscureText: true,
                        validator: (value) {
                          if(value != _formKey.currentState?.getRawValue('password'))
                            return "Пароли должны совподать";
                        },
                        decoration: InputDecoration(
                          hintText: "Повторите пароль",
                          hintStyle: TextStyle(color: ThemeWidget.of(context).notifier?.theme.textColor),
                          border: UnderlineInputBorder(borderSide: BorderSide(color: ThemeWidget.of(context).notifier!.theme.buttonColor)),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeWidget.of(context).notifier!.theme.buttonColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeWidget.of(context).notifier!.theme.buttonColor)),
                        ),
                        style: TextStyle(color: ThemeWidget.of(context).notifier?.theme.textColor),
                      ),
                      FormBuilderCheckbox(name: "privacy", title: Text("Принимаю политику обработки персональных данных", style: TextStyle(color: ThemeWidget.of(context).notifier?.theme.textColor),), validator: (value) {
                        value = value ?? false;
                        if(!value)
                          return "Нужно принять политику обработки";
                        },
                        activeColor: ThemeWidget.of(context).notifier?.theme.buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(width: 1.0, color: ThemeWidget.of(context).notifier!.theme.buttonColor),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState?.validate();
                          if(_formKey.currentState!.isValid) {
                            final snack = SnackBar(
                              content: Text(
                                "Вы успешно зарегистрировались",
                                style: TextStyle(color: ThemeWidget.of(context).notifier!.theme.backgroundColor),
                              ),
                              backgroundColor: ThemeWidget.of(context).notifier!.theme.textColor,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snack);
                          }
                        },
                        child: Text("Зарегистрироваться"),
                        style: ElevatedButton.styleFrom(
                          primary: ThemeWidget.of(context).notifier?.theme.buttonColor
                        )
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ThemeWidget.of(context).notifier?.changeTheme();
        },
        child: Icon(Icons.nightlight_round_outlined),
        backgroundColor: ThemeWidget.of(context).notifier?.theme.buttonColor,
      ),
    );
  }
}
