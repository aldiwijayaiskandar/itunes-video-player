import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_app/presentation/cubits/cubits.dart';

class HomeVideo extends StatelessWidget {
  const HomeVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoListCubit, VideoListState>(
      builder: (_, state) => SizedBox(
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            state.data[0].thumbnailUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
