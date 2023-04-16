import 'package:flutter/material.dart';
import 'package:video_player_app/domain/models/video.dart';

class VideoContent extends StatelessWidget {
  final Video data;

  const VideoContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    const double size = 16;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(size),
      child: Row(
        children: [
          Container(
            height: size * 2,
            width: size * 2,
            padding: const EdgeInsets.all(size / 2),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(size),
            ),
            child: Icon(
              Icons.play_arrow,
              color: Theme.of(context).scaffoldBackgroundColor,
              size: size,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: size),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.trackName,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Video",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
          Text(
            "${Duration(milliseconds: data.trackTimeMillis).inMinutes} Min",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
