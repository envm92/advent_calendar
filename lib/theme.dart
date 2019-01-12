import 'package:flutter/material.dart';

final ThemeData christmasTheme = _buildTheme();

ThemeData _buildTheme() {
  final ThemeData base = new ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Roboto'
  );
  return base.copyWith(
      accentColor: Colors.redAccent,
      primaryColor: Colors.lightGreen.shade700,
      buttonColor: Colors.lightGreen.shade800,
      buttonTheme: ButtonThemeData(
          minWidth: 150.0,
          textTheme: ButtonTextTheme.primary,
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          )
      )

  );
}