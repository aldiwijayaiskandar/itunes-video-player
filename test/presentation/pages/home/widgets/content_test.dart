import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart' as mocktail;
import 'package:video_player_app/presentation/cubits/cubits.dart';
import 'package:video_player_app/presentation/pages/home/widgets/widgets.dart';
import 'package:video_player_app/presentation/widgets/widgets.dart';

import '../../../../constants/constants.dart';
import '../../../../mocks/mocks.dart';
import '../../../../utils/utils.dart';

void main() {
  late VideoListCubit videoListCubit;

  setUp(() {
    videoListCubit = VideoListCubitMock();
  });

  testWidgets("Show x amount of video content", (tester) async {
    mocktail.when(() => videoListCubit.state).thenReturn(
          VideoListSuccessState(videoList),
        );

    await Utils.makeTestableWidget(
      tester: tester,
      body: BlocProvider(
        create: (_) => videoListCubit,
        child: Column(
          children: const [HomeContent()],
        ),
      ),
    );

    expect(find.byType(VideoContent), findsWidgets);
  });
}
