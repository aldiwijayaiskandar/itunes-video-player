import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player_app/constants/constants.dart';

class VideoPlayerControls extends StatefulWidget {
  final String thumbnailUrl;

  const VideoPlayerControls({
    super.key,
    required this.thumbnailUrl,
  });

  @override
  State<VideoPlayerControls> createState() => _VideoPlayerControlsState();
}

class _VideoPlayerControlsState extends State<VideoPlayerControls> {
  late ChewieController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = ChewieController.of(context);
  }

  Widget _buildButton(Widget icon) => SizedBox(
        width: 50,
        height: 50,
        child: icon,
      );

  Widget _buildPreviousButton() => _buildButton(
        const Center(
          child: Icon(
            Icons.skip_previous,
            color: Colors.white,
          ),
        ),
      );

  Widget _buildNextButton() => _buildButton(
        const Center(
          child: Icon(
            Icons.skip_next,
            color: Colors.white,
          ),
        ),
      );

  Widget _buildSpacer() => const SizedBox(width: 10);

  Widget _buildPlayButton() {
    return GestureDetector(
      onTap: () {
        controller.togglePause();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: ColorConstants.orange,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Icon(
            controller.isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildFullScreenButton() => Positioned(
        bottom: 16,
        right: 16,
        child: GestureDetector(
          onTap: () async {
            if (controller.isFullScreen) {
              await SystemChrome.setEnabledSystemUIMode(
                SystemUiMode.edgeToEdge,
                overlays: SystemUiOverlay.values,
              );
            } else {
              await SystemChrome.setEnabledSystemUIMode(
                SystemUiMode.edgeToEdge,
                overlays: [],
              );
            }
            controller.toggleFullScreen();
          },
          child: const Icon(
            Icons.fullscreen,
            color: Colors.white,
          ),
        ),
      );

  Widget _buildProgress() => Positioned(
        bottom: 0,
        left: 0,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 5,
              color: Colors.grey.shade400,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 100,
                height: 5,
                color: ColorConstants.orange,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.thumbnailUrl),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPreviousButton(),
              _buildSpacer(),
              _buildPlayButton(),
              _buildSpacer(),
              _buildNextButton(),
            ],
          ),
          _buildFullScreenButton(),
          _buildProgress(),
        ],
      ),
    );
  }
}
