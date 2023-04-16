import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_player_app/config/config.dart';

class Utils {
  static Future makeTestableWidget({
    required WidgetTester tester,
    required Widget body,
  }) async {
    return tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: body,
        ),
        theme: Themes.light,
      ),
    );
  }
}
