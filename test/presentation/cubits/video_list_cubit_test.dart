import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:video_player_app/domain/repositories/repositories.dart';
import 'package:video_player_app/presentation/cubits/cubits.dart';

import '../../constants/constants.dart';
import '../../mocks/mocks.dart';

void main() {
  final VideoRepo videoRepo = VideoRepoMock();
  late VideoListCubit cubit;

  setUp(() {
    cubit = VideoListCubit(videoRepo);
  });

  blocTest<VideoListCubit, VideoListState>(
    "Get video list successful",
    build: () => cubit,
    act: (bloc) async {
      when(() => videoRepo.getVideoList()).thenAnswer(
        (_) => Future(() => videoList),
      );

      await bloc.getVideoList();
    },
    expect: () => [
      const VideoListLoadingState([]),
      VideoListSuccessState(videoList),
    ],
  );

  blocTest<VideoListCubit, VideoListState>(
    "Get video list error",
    build: () => cubit,
    act: (bloc) async {
      when(() => videoRepo.getVideoList()).thenThrow(
        (_) => {},
      );

      await bloc.getVideoList();
    },
    expect: () => const [
      VideoListLoadingState([]),
      VideoListErrorState([]),
    ],
  );

  blocTest<VideoListCubit, VideoListState>(
    "Video state list still retain after loading again / error",
    build: () => cubit,
    act: (bloc) async {
      when(() => videoRepo.getVideoList()).thenAnswer(
        (_) => Future(() => videoList),
      );

      await bloc.getVideoList();

      when(() => videoRepo.getVideoList()).thenThrow(
        (_) => {},
      );
      await bloc.getVideoList();
    },
    expect: () => [
      const VideoListLoadingState([]),
      VideoListSuccessState(videoList),
      VideoListLoadingState(videoList),
      VideoListErrorState(videoList),
    ],
  );
}
