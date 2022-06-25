import 'package:flutter/material.dart';

class LightTheme {
  final _LightColor _lightColor = _LightColor();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)))),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.green),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Colors.green),
            side: const BorderSide(color: Colors.green)),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
                onPrimary: Colors.purple, onSecondary: _lightColor._blueMana)),
        colorScheme: const ColorScheme.light(),
        textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(fontSize: 25, color: _lightColor._textColor)));
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 27, 25, 25);
  final Color _blueMana = const Color.fromARGB(95, 188, 248, 1);
}
