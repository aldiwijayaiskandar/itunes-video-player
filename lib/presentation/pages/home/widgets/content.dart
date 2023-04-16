import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_app/presentation/cubits/cubits.dart';
import 'package:video_player_app/presentation/widgets/widgets.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoListCubit, VideoListState>(
      builder: (_, videoListState) => Expanded(
        child: ListView.builder(
          itemBuilder: (_, index) => BlocBuilder<CurrentVideoCubit, int>(
            builder: (context, currentIndex) {
              return VideoContent(
                isActive: currentIndex == index,
                data: videoListState.data[index],
                onClick: () {
                  BlocProvider.of<CurrentVideoCubit>(context)
                      .setCurrentVideoIndex(
                    index,
                  );
                },
              );
            },
          ),
          itemCount: videoListState.data.length,
        ),
      ),
    );
  }
}
