import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_player_app/config/config.dart';
import 'package:video_player_app/data/services/api/api.dart';

void main() {
  test("Setup dio successful", () async {
    await Environment.initializeEnvironment();
    Dio dio = setupDio();

    expect(dio.options.baseUrl, isNot(null));
  });
}
