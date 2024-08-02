import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sima/features/workout/barrel.dart';

@RoutePage(name: 'ExerciseDetailRoute')
class ExerciseDetailPage extends HookConsumerWidget {
  const ExerciseDetailPage({
    super.key,
    required this.exerciseKey,
  });

  final String exerciseKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TabController tabController = useTabController(initialLength: 2);
    final exercise = ref.watch(allexercisesControllerProvider).exercises[exerciseKey];

    return SafeArea(
      child: exercise != null
          ? Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  style: ButtonStyle(iconSize: MaterialStateProperty.all(30)),
                ),
                title: Text(
                  exercise.name,
                  style: context.textTheme.titleLarge?.copyWith(fontSize: 35),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(text: context.appTexts.details),
                    Tab(text: context.appTexts.history),
                  ],
                  labelStyle: context.textTheme.titleMedium,
                  controller: tabController,
                  unselectedLabelColor: context.theme.colorScheme.primary,
                  labelColor: context.theme.colorScheme.secondary,
                  indicatorColor: context.theme.colorScheme.secondary,
                  indicatorSize: TabBarIndicatorSize.tab,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
              body: TabBarView(
                controller: tabController,
                children: [
                  _InfoTab(exerciseKey: exercise.key),
                  _HistoryTab(exercise: exercise),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class _InfoTab extends HookConsumerWidget {
  const _InfoTab({
    required this.exerciseKey,
  });

  final String exerciseKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercise = ref.watch(allexercisesControllerProvider).exercises[exerciseKey];
    final customVideoPlayerController = useState<CustomVideoPlayerController?>(null);

    useEffect(() {
      if (exercise?.videoPath != null) {
        final videoController = CachedVideoPlayerController.file(File(exercise!.videoPath!));
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
      } else {
        customVideoPlayerController.value = null;
      }
      return customVideoPlayerController.value?.dispose;
    }, [exercise?.videoPath]);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.appTexts.desc}:',
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              exercise!.description,
              style: context.textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Row(
              children: [
                exercise.type == ExerciseType.reps
                    ? Text(
                        '${context.appTexts.maxWeight}:',
                        style: context.textTheme.titleLarge,
                      )
                    : Text(
                        '${context.appTexts.maxDur}:',
                        style: context.textTheme.titleLarge,
                      ),
                const Spacer(),
                exercise.type == ExerciseType.reps
                    ? Text(
                        '${exercise.max} kg',
                        style: context.textTheme.titleMedium,
                      )
                    : Text(
                        '${exercise.max} sec',
                        style: context.textTheme.titleMedium,
                      ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Text('${context.appTexts.video}:', style: context.textTheme.titleLarge),
          const SizedBox(height: 20),
          if (customVideoPlayerController.value != null)
            CustomVideoPlayer(
              customVideoPlayerController: customVideoPlayerController.value!,
            )
          else if (customVideoPlayerController.value != null)
            const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 20),
          Center(
            child: CustomTextButton(
              width: context.percentOfWidth(0.3),
              height: 40,
              onPressed: exercise.videoPath != null
                  ? () {
                      ref.read(allexercisesControllerProvider.notifier).setVideoPath(null, exercise.key);
                    }
                  : () async {
                      final picker = ImagePicker();
                      final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

                      if (pickedFile != null) {
                        ref.read(allexercisesControllerProvider.notifier).setVideoPath(pickedFile.path, exercise.key);
                      }
                    },
              text: exercise.videoPath != null ? context.appTexts.deleteVideo : context.appTexts.addVideo,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              CustomTextButton(
                width: context.percentOfWidth(0.4),
                height: 50,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomCreateExerciseDialog(
                        initialExercise: exercise,
                      );
                    },
                  );
                },
                text: context.appTexts.edit,
              ),
              const Spacer(),
              CustomTextButton(
                width: context.percentOfWidth(0.4),
                height: 50,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return WarningDialog(
                        action: context.appTexts.delete,
                        title: exercise.name,
                        onConfirm: () {
                          Navigator.of(context).pop();
                          ref.read(allexercisesControllerProvider.notifier).removeExercise(exercise.key);
                        },
                      );
                    },
                  );
                },
                text: context.appTexts.delete,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _HistoryTab extends StatelessWidget {
  const _HistoryTab({
    required this.exercise,
  });

  final ExerciseEntity exercise;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
