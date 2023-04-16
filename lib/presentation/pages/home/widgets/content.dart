import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_app/presentation/cubits/video_list/video.dart';
import 'package:video_player_app/presentation/widgets/widgets.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoListCubit, VideoListState>(
      builder: (_, state) => Expanded(
        child: ListView.builder(
          itemBuilder: (_, index) => VideoContent(
            data: state.data[index],
          ),
          itemCount: state.data.length,
        ),
      ),
    );
  }
}
