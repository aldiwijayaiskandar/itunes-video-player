import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_app/presentation/presentation.dart';

class HomeVideo extends StatelessWidget {
  const HomeVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoListCubit, VideoListState>(
      builder: (_, videoListState) => BlocBuilder<CurrentVideoCubit, int>(
        builder: (context, currentIndex) {
          return CustomVideoPlayer(
            data: videoListState.data[currentIndex],
          );
        },
      ),
    );
  }
}
