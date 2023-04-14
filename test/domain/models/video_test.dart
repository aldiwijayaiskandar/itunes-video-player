import 'package:flutter_test/flutter_test.dart';
import 'package:video_player_app/domain/models/models.dart';

void main() {
  test("FromJson returns value correctly", () async {
    int trackId = 1445738215;
    String trackName = "You And Your Heart";
    int trackTimeMillis = 5000;
    String previewUrl = "testPreviewUrl";

    Map<String, dynamic> videoMap = {
      "trackId": trackId,
      "trackName": trackName,
      "trackTimeMillis": trackTimeMillis,
      "previewUrl": previewUrl,
    };

    Video video = Video.fromJson(videoMap);

    expect(video.trackId, trackId);
    expect(video.trackName, trackName);
    expect(video.trackTimeMillis, trackTimeMillis);
    expect(video.previewUrl, previewUrl);

    expect(video.props, [trackId, trackName, trackTimeMillis, previewUrl]);
  });
}
