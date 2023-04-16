import 'dart:convert';

import 'package:video_player_app/data/services/api/api.dart';
import 'package:video_player_app/domain/models/models.dart';
import 'package:video_player_app/domain/repositories/repositories.dart';

class VideoRepoImpl extends VideoRepo {
  final ApiService apiService;

  VideoRepoImpl(this.apiService);

  @override
  Future<List<Video>> getVideoList() async {
    final result = await apiService.getApi(
      url: "/search?term=jack+johnson&entity=musicVideo",
    );

    return (jsonDecode(result.data)['results'] as List)
        .map((x) => Video.fromJson(x))
        .toList();
  }
}
