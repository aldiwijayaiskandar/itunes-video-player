import 'package:flutter/material.dart';
import 'package:video_player_app/constants/colors.dart';

class Themes {
  static ThemeData get light {
    return ThemeData(
      primaryColor: ColorConstants.orange,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme().apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: ColorConstants.orange,
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
    );
  }
}
