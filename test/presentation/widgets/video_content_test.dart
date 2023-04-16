import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_player_app/domain/models/video.dart';
import 'package:video_player_app/presentation/widgets/video_content.dart';

import '../../constants/constants.dart';
import '../../utils/utils.dart';

void main() {
  testWidgets(
    "Widget will show play icon, title & duration same as the data",
    (tester) async {
      Video video = videoList[0];

      await Utils.makeTestableWidget(
        tester: tester,
        body: VideoContent(
          data: video,
        ),
      );

      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
      expect(find.text(video.trackName), findsOneWidget);
      expect(
        find.text(
            "${Duration(milliseconds: video.trackTimeMillis).inMinutes} Min"),
        findsOneWidget,
      );
    },
  );
}
