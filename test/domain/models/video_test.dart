import 'package:flutter_test/flutter_test.dart';
import 'package:video_player_app/domain/models/models.dart';

void main() {
  const int trackId = 1445738215;
  const String trackName = "You And Your Heart";
  const int trackTimeMillis = 5000;
  const String previewUrl = "testPreviewUrl";

  test("Video constructor returns value correctly", () async {
    Video video = Video(
      trackId: trackId,
      trackName: trackName,
      trackTimeMillis: trackTimeMillis,
      previewUrl: previewUrl,
    );

    expect(video.trackId, trackId);
    expect(video.trackName, trackName);
    expect(video.trackTimeMillis, trackTimeMillis);
    expect(video.previewUrl, previewUrl);

    expect(video.props, [trackId, trackName, trackTimeMillis, previewUrl]);
  });

  test("Video.fromJson() returns value correctly", () async {
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
