import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_app/presentation/cubits/cubits.dart';

class HomeVideo extends StatelessWidget {
  const HomeVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoListCubit, VideoListState>(
      builder: (_, videoListState) => Stack(
        alignment: Alignment.center,
        children: [
          BlocBuilder<CurrentVideoCubit, int>(
            builder: (context, curentIndex) {
              return SizedBox(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    videoListState.data[curentIndex].thumbnailUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: Icon(
                    Icons.skip_previous,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: Icon(
                    Icons.skip_next,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              "Preview",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),
            ),
          ),
          const Positioned(
            bottom: 16,
            right: 16,
            child: Icon(
              Icons.fullscreen,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
