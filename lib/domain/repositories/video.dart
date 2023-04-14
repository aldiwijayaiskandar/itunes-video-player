import 'package:video_player_app/domain/models/video.dart';

abstract class VideoRepo {
  Future<List<Video>> getVideoList();
}
