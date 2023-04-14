import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_app/domain/repositories/repositories.dart';
import 'package:video_player_app/presentation/cubits/video_list/video.dart';

class VideoListCubit extends Cubit<VideoListState> {
  final VideoRepo videoRepo;

  VideoListCubit(this.videoRepo) : super(const VideoListState([]));

  Future getVideoList() async {
    try {
      emit(VideoListLoadingState(state.data));

      final result = await videoRepo.getVideoList();

      emit(VideoListSuccessState(result));
    } catch (err) {
      emit(VideoListErrorState(state.data));
    }
  }
}
