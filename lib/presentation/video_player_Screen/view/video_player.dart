// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:lumainar/core/constants/colors.dart';

// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key, required this.videoId});
//   final String videoId;
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late YoutubePlayerController _controller;
//   String videoId = '';
//   @override
//   void initState() {
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<bool> _onWillPop() async {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         appBar: AppBar(
//           iconTheme: IconThemeData(color: Colors.white),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         extendBody: true,
//         backgroundColor: Colors.black,
//         body: YoutubePlayer(
//           controller: _controller,
//           showVideoProgressIndicator: true,
//           progressColors: ProgressBarColors(
//               backgroundColor: ColorConstant.primary1,
//               handleColor: ColorConstant.iconRose,
//               playedColor: ColorConstant.primary1),
//           progressIndicatorColor: ColorConstant.primary1,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  const VideoPlayerScreen({Key? key, required this.videoId}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  bool fullScreen = false;

  List<YoutubePlayerController> lYTC = [];
  Map<String, dynamic> cStates = {};
  late YoutubePlayerController _ytController;

  @override
  void initState() {
    _ytController = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: true,
        captionLanguage: 'en',
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    for (var element in lYTC) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: (widget.videoId.isNotEmpty)
          ? YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _ytController,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.lightGreen,
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                  FullScreenButton(),
                ],
                onReady: () {},
                onEnded: (YoutubeMetaData _md) {
                  _ytController.seekTo(const Duration(seconds: 0));
                },
              ),
              builder: (context, player) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // some widgets
                      player,
                      // some other widgets
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: Text("No Videos"),
            ),
    );
  }
}
