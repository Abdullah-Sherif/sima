import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class CustomExerciseTile extends HookConsumerWidget {
  const CustomExerciseTile({
    super.key,
    required this.exerciseKey,
    required this.onExpand,
    required this.onPlay,
    required this.onCheck,
    this.isExpanded = false,
    this.width = double.infinity,
    this.verticalMargin = 8,
    this.horizontalMargin = 10,
  });

  final String exerciseKey;
  final bool isExpanded;
  final double width;
  final double verticalMargin;
  final double horizontalMargin;
  final Function() onExpand;
  final Function() onPlay;
  final Function(bool?)? onCheck;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var contentVisibility = useState(isExpanded);
    var descriptionVisibility = useState(false);

    useEffect(() {
      if (isExpanded) {
        contentVisibility.value = true;
      } else {
        Future.delayed(const Duration(milliseconds: 300), () {
          contentVisibility.value = false;
        });
      }
      return null;
    }, [isExpanded]);

    void toggleDescriptionVisibility() {
      descriptionVisibility.value = !descriptionVisibility.value;
    }

    final cycle = ref.watch(allcyclesControllerProvider).cycle;
    final dayNum = ref.read(weekControllerProvider.notifier).getCurrentDayNumberWithOffset();
    final exercise = cycle.workouts.values.elementAt(dayNum - 1).getExerciseByKey(exerciseKey);

    final scrollController = useScrollController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalMargin, horizontal: horizontalMargin),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isExpanded ? 300 : 60,
        width: isExpanded ? width : width * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: Text(
                      exercise!.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: context.textTheme.titleMedium?.copyWith(fontSize: 23),
                    ),
                  ),
                  const Spacer(),
                  _AnimatedExpandedWidgets(
                    exercise: exercise,
                    isExpanded: isExpanded,
                    onPlay: onPlay,
                    onCheck: onCheck,
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? -0.25 : 0.25,
                    duration: const Duration(milliseconds: 300),
                    child: IconButton(
                      iconSize: 27,
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                      onPressed: () {
                        onExpand();
                      },
                    ),
                  )
                ],
              ),
              if (contentVisibility.value)
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ExerciseDescription(
                        exercise: exercise,
                        descriptionVisible: descriptionVisibility.value,
                        onExpand: toggleDescriptionVisibility,
                      ),
                      const SizedBox(height: 5),
                      _SetTitles(exercise: exercise),
                      SizedBox(
                        height: 150,
                        child: Scrollbar(
                          thumbVisibility: true,
                          controller: scrollController,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: ListView.builder(
                              controller: scrollController,
                              itemBuilder: (context, index) {
                                final set = exercise.sets.values.elementAt(index);
                                return CustomSetTile(
                                  set: set,
                                  setNum: index + 1,
                                  exerciseKey: exerciseKey,
                                );
                              },
                              itemCount: exercise.sets.length,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SetTitles extends StatelessWidget {
  const _SetTitles({
    required this.exercise,
  });

  final ExerciseEntity exercise;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 65, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.appTexts.set,
            style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          if (exercise.isReps) ...[
            Text(
              context.appTexts.reps,
              style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              context.appTexts.weight,
              style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ] else ...[
            Text(
              context.appTexts.duration,
              style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
          const Icon(Icons.check),
        ],
      ),
    );
  }
}

class _ExerciseDescription extends StatelessWidget {
  const _ExerciseDescription({
    required this.exercise,
    required this.descriptionVisible,
    required this.onExpand,
  });

  final ExerciseEntity exercise;
  final bool descriptionVisible;
  final Function() onExpand;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AnimatedSize(
            alignment: Alignment.topCenter,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 200),
            child: TextButton(
              onPressed: onExpand,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  alignment: Alignment.centerLeft),
              child: Text(
                exercise.description,
                maxLines: descriptionVisible ? null : 1,
                overflow: descriptionVisible ? TextOverflow.visible : TextOverflow.ellipsis,
                style: context.textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AnimatedExpandedWidgets extends StatelessWidget {
  const _AnimatedExpandedWidgets({
    required this.exercise,
    required this.isExpanded,
    required this.onPlay,
    required this.onCheck,
  });
  final ExerciseEntity exercise;
  final bool isExpanded;
  final Function() onPlay;
  final Function(bool?)? onCheck;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 48,
      width: isExpanded ? 120 : 0,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isExpanded ? 60 : 160,
            child: IconButton(
              icon: const Icon(Icons.play_circle_fill),
              iconSize: 27,
              onPressed: onPlay,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isExpanded ? 0 : 160,
            child: Checkbox(
              value: exercise.isCompleted,
              onChanged: onCheck,
            ),
          ),
        ],
      ),
    );
  }
}
