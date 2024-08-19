import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PersonalizedVideoPlayer extends HookWidget {
  const PersonalizedVideoPlayer({
    super.key,
    required this.videoPath,
  });

  final String videoPath;

  @override
  Widget build(BuildContext context) {
    final customVideoPlayerController = useState<CustomVideoPlayerController?>(null);

    useEffect(() {
      final videoController = CachedVideoPlayerController.file((File(videoPath)));
      final newController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoController,
        customVideoPlayerSettings: const CustomVideoPlayerSettings(
          playButton: Icon(Icons.play_arrow, color: Colors.white),
          pauseButton: Icon(Icons.pause, color: Colors.white),
          showFullscreenButton: false,
          settingsButtonAvailable: false,
          showMuteButton: false,
        ),
      );
      videoController.initialize().then((_) {
        customVideoPlayerController.value = newController;
      });
      return customVideoPlayerController.value?.dispose;
    }, []);

    return customVideoPlayerController.value != null
        ? CustomVideoPlayer(
            customVideoPlayerController: customVideoPlayerController.value!,
          )
        : const SizedBox(
            width: 10,
            height: 50,
            child: Center(child: CircularProgressIndicator()),
          );
  }
}
