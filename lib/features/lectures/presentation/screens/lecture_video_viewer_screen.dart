import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:e_learning_app/features/lectures/data/model/lecture.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LectureVideoViewerScreen extends StatefulWidget {
  const LectureVideoViewerScreen({
    Key? key,
    required this.lecture,
  }) : super(key: key);
  static const String routeName = '/lecture_video_viewer_screen';
  final Lecture lecture;
  @override
  State<LectureVideoViewerScreen> createState() =>
      _LectureVideoViewerScreenState();
}

class _LectureVideoViewerScreenState extends State<LectureVideoViewerScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.lecture.video!);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          text: widget.lecture.name!, onPressed: () => Navigator.pop(context)),
      body: Column(
        children: [
          YoutubePlayer(
            progressIndicatorColor: Theme.of(context).primaryColor,
            controller: _controller,
            showVideoProgressIndicator: true,
            bottomActions: [
              FullScreenButton(),
              PlaybackSpeedButton(
                controller: _controller,
              ),
              RemainingDuration(
                controller: _controller,
              ),
              ProgressBar(
                isExpanded: true,
                colors: ProgressBarColors(
                  playedColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey[700],
                  bufferedColor: Colors.grey,
                  handleColor: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
              ),
              CurrentPosition(),
            ],
          )
        ],
      ),
    );
  }
}
