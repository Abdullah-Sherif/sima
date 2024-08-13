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
    required this.exerciseIndex,
  });

  final int exerciseIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercises = ref.watch(fetchAllExercisesControllerProvider).exercises;
    final exercise = exercises.length > exerciseIndex
        ? ref.watch(fetchAllExercisesControllerProvider).exercises[exerciseIndex]
        : const ExerciseEntity(name: '', description: '', key: 'key');
    final TabController tabController = useTabController(initialLength: 2);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
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
            _InfoTab(exercise: exercise),
            _HistoryTab(exercise: exercise),
          ],
        ),
      ),
    );
  }
}

class _InfoTab extends HookConsumerWidget {
  const _InfoTab({
    required this.exercise,
  });

  final ExerciseEntity exercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editExercisesStatus = ref.watch(editExercisesControllerProvider).status;

    useEffect(() {
      if (editExercisesStatus == FetchStatus.failure) {
        showSnackbar(context: context, text: context.appTexts.errorOccured);
      }
      return null;
    }, [editExercisesStatus]);

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
              exercise.description,
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
                        context.convertSecondsToTime(exercise.max),
                        style: context.textTheme.titleMedium,
                      ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Text('${context.appTexts.video}:', style: context.textTheme.titleLarge),
          const SizedBox(height: 20),
          if (exercise.videoPath != null)
            PersonalizedVideoPlayer(
              videoPath: exercise.videoPath!,
            ),
          const SizedBox(height: 20),
          Center(
            child: CustomTextButton(
              width: context.percentOfWidth(0.3),
              height: 40,
              onPressed: exercise.videoPath != null
                  ? () {
                      ref.read(editExercisesControllerProvider.notifier).updateExercise(exercise.copyWith(videoPath: null));
                    }
                  : () async {
                      final picker = ImagePicker();
                      final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

                      if (pickedFile != null) {
                        ref
                            .read(editExercisesControllerProvider.notifier)
                            .updateExercise(exercise.copyWith(videoPath: pickedFile.path));
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
                          ref.read(editExercisesControllerProvider.notifier).deleteExercise(exercise.key);
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final log = exercise.logs[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${log.date.day}/${log.date.month}/${log.date.year}',
                      style: context.textTheme.titleMedium?.copyWith(fontSize: 22),
                    ),
                    Text(
                      '${context.appTexts.cycle} ${log.cycleNum}  |  ${context.appTexts.day} ${log.dayNum}',
                      style: context.textTheme.titleMedium?.copyWith(fontSize: 22),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (log.sets.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        context.appTexts.set,
                        style: context.textTheme.titleMedium,
                      ),
                      if (exercise.type == ExerciseType.reps) ...[
                        Text(
                          context.appTexts.weight,
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          context.appTexts.reps,
                          style: context.textTheme.titleMedium,
                        ),
                      ] else ...[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text(
                            context.appTexts.duration,
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ],
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final set = log.sets[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${index + 1}',
                            style: context.textTheme.titleMedium,
                          ),
                          if (exercise.type == ExerciseType.reps) ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text(
                                '${set.weight} kg',
                                style: context.textTheme.titleMedium,
                              ),
                            ),
                            Text(
                              '${set.reps}',
                              style: context.textTheme.titleMedium,
                            ),
                          ] else ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                context.convertSecondsToTime(set.durationInSec!),
                                style: context.textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                  itemCount: log.sets.length,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: exercise.logs.length,
      ),
    );
  }
}
