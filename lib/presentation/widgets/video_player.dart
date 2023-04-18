import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/domain/models/video.dart';
import 'package:video_player_app/presentation/widgets/video_player_controls.dart';

class CustomVideoPlayer extends StatefulWidget {
  final Video data;
  const CustomVideoPlayer({super.key, required this.data});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initVideo();
  }

  @override
  void dispose() {
    super.dispose();
    if (_videoController!.value.isInitialized) {
      _videoController!.dispose();
      _chewieController.dispose();
    }
  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_videoController!.value.isInitialized) {
      initVideo();
    }
  }

  void initVideo() {
    disposeVideo();

    _videoController = VideoPlayerController.network(widget.data.previewUrl);
    _videoController!.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoController!,
      allowFullScreen: true,
      aspectRatio: 16 / 9,
      customControls: VideoPlayerControls(
        thumbnailUrl: widget.data.thumbnailUrl,
      ),
      showControls: true,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeRight],
    );
  }

  void disposeVideo() {
    if (_videoController != null && _videoController!.value.isInitialized) {
      _videoController!.dispose();
      _chewieController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
