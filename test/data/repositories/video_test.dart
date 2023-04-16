import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:video_player_app/data/repositories/repositories.dart';
import 'package:video_player_app/data/services/services.dart';
import 'package:video_player_app/domain/repositories/repositories.dart';

import '../../constants/video.dart';
import '../../mocks/api.dart';

void main() {
  final ApiService api = MockApiService();
  late VideoRepo repo;

  setUp(() {
    repo = VideoRepoImpl(api);
  });

  test("Get video list successful", () async {
    when(
      () => api.getApi(url: "/search?term=jack+johnson&entity=musicVideo"),
    ).thenAnswer(
      (_) => Future(
        () => Response(
          requestOptions: RequestOptions(),
          data: jsonEncode(videoJson),
        ),
      ),
    );

    final result = await repo.getVideoList();

    expect(result, videoList);
  });
}
