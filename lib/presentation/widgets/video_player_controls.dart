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
  bool _hideThumbnail = false;
  Duration _duration = Duration.zero;
  Duration _lastPosition = Duration.zero;
  late ChewieController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = ChewieController.of(context);
    _controller.videoPlayerController.addListener(listener);
    setState(() {
      _hideThumbnail = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.videoPlayerController.removeListener(listener);
  }

  void listener() {
    setState(() {
      _duration = _controller.videoPlayerController.value.duration;
      _lastPosition = _controller.videoPlayerController.value.position;
    });
  }

  void startVideo() {
    setState(() {
      _hideThumbnail = true;
    });
  }

  Widget _buildButton(Widget icon, void Function() onTap) => GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 50,
          height: 50,
          child: icon,
        ),
      );

  Widget _buildPreviousButton() => _buildButton(
        const Center(
          child: Icon(
            Icons.skip_previous,
            color: Colors.white,
          ),
        ),
        () {
          startVideo();
          _controller.seekTo(_lastPosition - const Duration(seconds: 15));
        },
      );

  Widget _buildNextButton() => _buildButton(
        const Center(
          child: Icon(
            Icons.skip_next,
            color: Colors.white,
          ),
        ),
        () {
          startVideo();
          _controller.seekTo(_lastPosition + const Duration(seconds: 15));
        },
      );

  Widget _buildSpacer() => const SizedBox(width: 10);

  Widget _buildPlayButton() {
    return GestureDetector(
      onTap: () {
        _controller.togglePause();
        startVideo();
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
            _controller.videoPlayerController.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
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
            if (_controller.isFullScreen) {
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
            _controller.toggleFullScreen();
          },
          child: Icon(
            _controller.isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
            color: Colors.white,
          ),
        ),
      );

  Widget _buildProgress() => Positioned(
        bottom: 0,
        left: 0,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: LinearProgressIndicator(
            color: ColorConstants.orange,
            backgroundColor: Colors.grey.shade400,
            value: _lastPosition.inSeconds / _duration.inSeconds,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: _hideThumbnail
          ? null
          : BoxDecoration(
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
