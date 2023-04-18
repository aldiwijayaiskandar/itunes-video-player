import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart' as mocktail;
import 'package:video_player_app/presentation/cubits/cubits.dart';
import 'package:video_player_app/presentation/pages/home/widgets/widgets.dart';
import 'package:video_player_app/presentation/pages/pages.dart';

import '../../../constants/constants.dart';
import '../../../mocks/mocks.dart';
import '../../../utils/utils.dart';

void main() {
  late VideoListCubit videoListCubit;

  setUp(() {
    videoListCubit = VideoListCubitMock();
  });

  testWidgets(
    "Show error widget if video list error",
    (tester) async {
      mocktail.when(() => videoListCubit.state).thenReturn(
            const VideoListErrorState([]),
          );

      await Utils.makeTestableWidget(
        tester: tester,
        body: BlocProvider(
          create: (_) => videoListCubit,
          child: const HomePage(),
        ),
      );

      expect(find.byType(HomePageError), findsOneWidget);
    },
  );

  testWidgets(
    "Show loading widget when loading",
    (tester) async {
      mocktail.when(() => videoListCubit.state).thenReturn(
            const VideoListLoadingState([]),
          );

      await Utils.makeTestableWidget(
        tester: tester,
        body: BlocProvider(
          create: (_) => videoListCubit,
          child: const HomePage(),
        ),
      );

      expect(find.byType(HomePageLoading), findsOneWidget);
    },
  );
}
