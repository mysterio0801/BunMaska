import 'package:flutter/material.dart';

class OurTheme {
  ThemeData buildTheme() {
    return ThemeData(
      //AppBar Theme
      appBarTheme: AppBarTheme(color: Colors.orange[400]),
      //Button Theme
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.orange[400],
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        minWidth: 100.0,
        height: 40.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
