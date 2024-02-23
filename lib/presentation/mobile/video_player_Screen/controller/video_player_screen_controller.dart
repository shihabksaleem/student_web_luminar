import 'package:flutter/material.dart';

class VideoPlayerScreenController extends ChangeNotifier {
  getVideoId({required String url}) {
    List<String> videoId = url.split("/");
    if (videoId.length > 1) {
      return videoId.last;
    } else {
      return "";
    }
  }
}
