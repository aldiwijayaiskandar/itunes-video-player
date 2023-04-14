import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_player_app/config/config.dart';

void main() {
  test("Get light themes", () {
    ThemeData lightTheme = Themes.light;

    expect(lightTheme.scaffoldBackgroundColor, Colors.white);
  });

  test("Get dark themes", () {
    ThemeData lightTheme = Themes.dark;

    expect(lightTheme.scaffoldBackgroundColor, Colors.black);
  });
}
