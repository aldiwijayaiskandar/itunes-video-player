import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:video_player_app/presentation/cubits/cubits.dart';

class VideoListCubitMock extends MockCubit<VideoListState>
    implements VideoListCubit {}

class VideoListLoadingStateFake extends Fake implements VideoListLoadingState {}

class VideoListSuccessStateFake extends Fake implements VideoListSuccessState {}

class VideoListErrorStateFake extends Fake implements VideoListErrorState {}
