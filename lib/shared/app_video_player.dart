import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class AppVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final VoidCallback? onFinished;
  const AppVideoPlayer({
    super.key,
    required this.videoUrl,
    this.onFinished,
  });

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/dash.mp4',
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    _controller.addListener(() async {
      if (_controller.value.position == _controller.value.duration) {
        widget.onFinished?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? VideoPlayer(_controller)
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
