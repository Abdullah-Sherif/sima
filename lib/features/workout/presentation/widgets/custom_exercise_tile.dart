import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class CustomExerciseTile extends ConsumerStatefulWidget {
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
  ConsumerState<CustomExerciseTile> createState() => CustomExerciseTileState();
}

class CustomExerciseTileState extends ConsumerState<CustomExerciseTile> {
  late bool _contentVisible;
  bool descriptionVisible = false;

  @override
  void initState() {
    super.initState();
    _contentVisible = widget.isExpanded;
  }

  void _toggleContentVisibility() {
    setState(() {
      Future.delayed(const Duration(milliseconds: 300), () {
        _contentVisible = !_contentVisible;
      });
    });
  }

  void _toggleDescriptionVisibility() {
    setState(() {
      descriptionVisible = !descriptionVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cycle = ref.watch(allcyclesControllerProvider).cycle;
    final dayNum = ref.read(weekControllerProvider.notifier).getCurrentDayNumberWithOffset();
    final exercise = cycle.workouts.values.elementAt(dayNum - 1).getExerciseByKey(widget.exerciseKey);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.verticalMargin, horizontal: widget.horizontalMargin),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.isExpanded ? 300 : 60,
        width: widget.isExpanded ? widget.width : widget.width * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    exercise!.name,
                    style: context.textTheme.titleMedium?.copyWith(fontSize: 23),
                  ),
                  const Spacer(),
                  _AnimatedExpandedWidgets(widget: widget, exercise: exercise),
                  _CustomExpandButton(
                    widget: widget,
                    onExpand: () {
                      widget.isExpanded ? _toggleContentVisibility() : _contentVisible = true;
                      widget.onExpand();
                    },
                    iconSize: 27,
                    isExpanded: widget.isExpanded,
                  ),
                ],
              ),
              if (_contentVisible)
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: descriptionVisible ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AnimatedSize(
                                alignment: Alignment.topCenter,
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 200),
                                child: Text(
                                  exercise.description,
                                  maxLines: descriptionVisible ? null : 1,
                                  overflow: descriptionVisible ? TextOverflow.visible : TextOverflow.ellipsis,
                                  style: context.textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            _CustomExpandButton(
                              widget: widget,
                              onExpand: () {
                                _toggleDescriptionVisibility();
                              },
                              iconSize: 13,
                              isExpanded: descriptionVisible,
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Set',
                              style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 40),
                            if (exercise.isReps) ...[
                              Text(
                                'Reps',
                                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 40),
                              Text(
                                'Weight',
                                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ] else ...[
                              Text(
                                'Duration',
                                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomExpandButton extends StatelessWidget {
  const _CustomExpandButton({
    required this.widget,
    required this.onExpand,
    this.iconSize,
    required this.isExpanded,
  });

  final CustomExerciseTile widget;
  final Function() onExpand;
  final double? iconSize;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: isExpanded ? -0.25 : 0.25,
      duration: const Duration(milliseconds: 300),
      child: IconButton(
        iconSize: iconSize,
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: onExpand,
      ),
    );
  }
}

class _AnimatedExpandedWidgets extends StatelessWidget {
  const _AnimatedExpandedWidgets({
    required this.widget,
    required this.exercise,
  });

  final CustomExerciseTile widget;
  final ExerciseEntity exercise;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 48,
      width: widget.isExpanded ? 120 : 0,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: widget.isExpanded ? 60 : 160,
            child: IconButton(
              icon: const Icon(Icons.play_circle_fill),
              iconSize: 27,
              onPressed: widget.onPlay,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: widget.isExpanded ? 0 : 160,
            child: Checkbox(
              value: exercise.isCompleted,
              onChanged: widget.onCheck,
            ),
          ),
        ],
      ),
    );
  }
}
