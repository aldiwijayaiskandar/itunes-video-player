import 'package:flutter_test/flutter_test.dart';
import 'package:video_player_app/presentation/pages/home/widgets/widgets.dart';

import '../../../../utils/utils.dart';

void main() {
  testWidgets("show 'Error Fetching Video List' text", (tester) async {
    await Utils.makeTestableWidget(
      tester: tester,
      body: const HomePageError(),
    );

    expect(find.text("Error Fetching Video List"), findsOneWidget);
  });
}
