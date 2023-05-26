import 'package:flutter/material.dart';

class MyTheme{
  static final darkTheme = ThemeData.dark(useMaterial3: true);
  static final themeData = darkTheme.copyWith(
    colorScheme:
    ColorScheme.fromSeed(seedColor: Colors.black,),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: darkTheme.appBarTheme.copyWith(
      color: Colors.black,
      elevation: 0,
    ),
    progressIndicatorTheme: darkTheme.progressIndicatorTheme.copyWith(color: Colors.white),
    textTheme: darkTheme.textTheme.copyWith(
      titleLarge: darkTheme.textTheme.titleLarge?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
      titleMedium: darkTheme.textTheme.titleMedium?.copyWith(
        color: Colors.white,
      ),
      bodyLarge: darkTheme.textTheme.bodyLarge?.copyWith(
        color: Colors.white,
      ),
      bodyMedium: darkTheme.textTheme.bodyMedium?.copyWith(
        color: Colors.white,
      ),
    ),
  );
}

