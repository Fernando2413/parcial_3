import 'package:flutter/material.dart';

class AppTheme{
  ThemeData getTheme(){
    const seedColor = Color.fromARGB(255, 192, 255, 192);

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
    );
  }

}