import 'package:bloc_test/bloc_test.dart';
import 'package:video_player_app/presentation/cubits/cubits.dart';

void main() {
  blocTest<CurrentVideoCubit, int>(
    "Set current video index",
    build: () => CurrentVideoCubit(),
    act: (bloc) {
      bloc.setCurrentVideoIndex(2);
      bloc.setCurrentVideoIndex(3);
      bloc.setCurrentVideoIndex(4);
    },
    expect: () => [2, 3, 4],
  );
}
