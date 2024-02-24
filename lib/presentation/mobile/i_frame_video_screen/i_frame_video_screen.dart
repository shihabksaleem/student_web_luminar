import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class IFrameVideoPlayerScreen extends StatefulWidget {
  final String videoId;
  const IFrameVideoPlayerScreen({Key? key, required this.videoId}) : super(key: key);

  @override
  State<IFrameVideoPlayerScreen> createState() => _IFrameVideoPlayerScreenState();
}

class _IFrameVideoPlayerScreenState extends State<IFrameVideoPlayerScreen> {
  bool fullScreen = false;

  // List<YoutubePlayerController> lYTC = [];
  // Map<String, dynamic> cStates = {};
  // late YoutubePlayerController _ytController;

  // If the requirement is just to play a single video.
  var _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: (widget.videoId.isNotEmpty)
          ? YoutubePlayer(
              controller: _controller,
              aspectRatio: 16 / 9,
            )
          : const Center(
              child: Text("No Videos"),
            ),
    );
  }
}
