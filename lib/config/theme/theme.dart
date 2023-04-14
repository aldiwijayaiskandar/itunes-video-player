import 'package:flutter/material.dart';

class Themes {
  static ThemeData get light {
    return ThemeData(
      primaryColor: const Color.fromRGBO(255, 143, 20, 1),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme().apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: const Color.fromRGBO(255, 143, 20, 1),
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
    );
  }
}
