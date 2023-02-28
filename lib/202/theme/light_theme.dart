import 'package:flutter/material.dart';

class LightTheme{

  final _lightColor = _LightColor();

  late ThemeData theme;

  LightTheme(){
    theme = ThemeData(

      appBarTheme: AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(33))
        )
      ),
      
    scaffoldBackgroundColor: Colors.white.withOpacity(0.9),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.lightGreenAccent),

    colorScheme: ColorScheme.light(),

    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
        onPrimary: Colors.purpleAccent, onSecondary: _lightColor.blueMenia
      )
    ),

    checkboxTheme: CheckboxThemeData(
      side: BorderSide(color: Colors.black),
      fillColor: MaterialStateProperty.all(Colors.green),
    ),

    textTheme: ThemeData.light().textTheme.copyWith(
    subtitle1: TextStyle(fontSize: 25, color: Colors.black)
    ),);
  }
}

class _LightColor {
  final Color _textColor = Color.fromARGB(255, 27, 25, 25);
  final Color blueMenia = Color.fromARGB(95, 188, 248, 1);
}