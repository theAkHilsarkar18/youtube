import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videoprovider extends ChangeNotifier {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void initVideo(String videopath) {
    videoPlayerController = VideoPlayerController.asset(
      "${videopath}",
    );
    videoPlayerController!.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        fullScreenByDefault: true,
      allowMuting: true,
      allowFullScreen: true,
      aspectRatio: 16/9,

    );
  }

  Future<void> stopVideo() async {
    await videoPlayerController!.pause();
  }

  List videoPath = [
    "assets/video/kgf.mp4",
    "assets/video/rrr.mp4",
    "assets/video/lela.mp4",
    "assets/video/love.mp4",
    "assets/video/bb.mp4",
    "assets/video/mehr.mp4",
    "assets/video/prem.mp4",
    "assets/video/apna.mp4",
    "assets/video/pathan.mp4",
  ];
}
