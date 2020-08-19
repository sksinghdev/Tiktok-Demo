import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  var videoUrl;
  AppVideoPlayer(this.videoUrl);
  @override
  _AppVideoPlayerState createState() => _AppVideoPlayerState(this.videoUrl);
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  VideoPlayerController _controller;
  var videoUrl;
  _AppVideoPlayerState(this.videoUrl);
  @override
  void initState() {
    super.initState();
    print('video url is  : $videoUrl');
    _controller = VideoPlayerController.network(
        videoUrl)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.initialized
          ? AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      )
          : Container(
        color: Colors.black,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}