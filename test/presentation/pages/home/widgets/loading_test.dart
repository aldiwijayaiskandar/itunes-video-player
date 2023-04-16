import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_player_app/presentation/pages/home/widgets/widgets.dart';

import '../../../../utils/utils.dart';

void main() {
  testWidgets("Show circular activity", (tester) async {
    await Utils.makeTestableWidget(
      tester: tester,
      body: const HomePageLoading(),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
