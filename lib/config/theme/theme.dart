import 'package:flutter/material.dart';

import 'styles.dart';

ThemeData myThemeData() => ThemeData(
      primaryColor: primaryColor,
      accentColor: accentColor,
      textTheme: myTextTheme,
      scaffoldBackgroundColor: bgColor,
      appBarTheme: _myAppBar,
      bottomNavigationBarTheme: _myBottomNavBar,
      inputDecorationTheme: _myInputDecorationTheme,
    );

InputDecorationTheme _myInputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(color: accentColor),
  ),
  labelStyle: TextStyle(color: accentColor),
);

AppBarTheme _myAppBar = AppBarTheme(
  centerTitle: true,
  textTheme: myTextTheme,
  backgroundColor: bgColor,
  brightness: Brightness.light,
  elevation: 0,
);

BottomNavigationBarThemeData _myBottomNavBar = BottomNavigationBarThemeData(
  selectedItemColor: accentColor,
  unselectedItemColor: unselectedColor,
  backgroundColor: primaryColor,
);
