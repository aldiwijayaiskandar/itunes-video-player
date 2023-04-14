import 'package:equatable/equatable.dart';
import 'package:video_player_app/domain/models/models.dart';

class VideoListState extends Equatable {
  final List<Video> data;

  const VideoListState(this.data);

  @override
  List<Object?> get props => [data];
}

class VideoListLoadingState extends VideoListState {
  const VideoListLoadingState(super.data);
}

class VideoListSuccessState extends VideoListState {
  const VideoListSuccessState(super.data);
}

class VideoListErrorState extends VideoListState {
  const VideoListErrorState(super.data);
}
