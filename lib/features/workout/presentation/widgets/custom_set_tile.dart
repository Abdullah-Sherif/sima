import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class CustomSetTile extends HookConsumerWidget {
  const CustomSetTile({
    super.key,
    required this.set,
    required this.setNum,
  });

  final SetEntity set;
  final int setNum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final TextEditingController? repsController;
    late final TextEditingController? weightController;

    final currentDate = ref.watch(dateControllerProvider).dateWithOffset;
    final workout = ref.watch(fetchCyclesControllerProvider.notifier).getWorkout(currentDate);

    if (set.isWeightSet) {
      repsController = useTextEditingController(text: set.reps.toString());
      weightController = useTextEditingController(text: set.weight.toString());
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: context.percentOfWidth(0.8),
        height: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 38, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$setNum',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (set.isWeightSet) ...[
                  _CustomSetInputField(
                    controller: repsController!,
                    onEditingComplete: (value) {
                      if (value != set.reps.toString()) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ref.read(editWorkoutExerciseControllerProvider.notifier).updateSetReps(
                                set,
                                workout!.key,
                                value != '' ? int.parse(value) : 0,
                              );
                        });
                      }
                    },
                  ),
                  _CustomSetInputField(
                    controller: weightController!,
                    onEditingComplete: (value) {
                      if (value != set.weight.toString()) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ref.read(editWorkoutExerciseControllerProvider.notifier).updateSetWeight(
                                set,
                                workout!.key,
                                value != '' ? int.parse(value) : 0,
                              );
                        });
                      }
                    },
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: TextButton(
                      onPressed: () async {
                        int? selectedTimeInSeconds = await showModalBottomSheet<int>(
                          context: context,
                          builder: (context) => _HMSPicker(initialTimeInSeconds: set.durationInSec!),
                        );

                        if (selectedTimeInSeconds != null) {
                          ref.read(editWorkoutExerciseControllerProvider.notifier).updateSetDuration(
                                set,
                                workout!.key,
                                selectedTimeInSeconds,
                              );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: Text(
                        context.convertSecondsToTime(set.durationInSec!),
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600, backgroundColor: Colors.transparent),
                      ),
                    ),
                  ),
                ],
                Checkbox(
                  value: set.isCompleted,
                  onChanged: (value) {
                    if (value != null) {
                      final currentDate = ref.watch(dateControllerProvider).dateWithOffset;
                      final completeExercise =
                          ref.watch(editWorkoutExerciseControllerProvider).activeExercise?.setSetIsComplete(value, set.key);
                      if (completeExercise != null) {
                        final completeWorkout = ref
                            .read(fetchCyclesControllerProvider.notifier)
                            .getWorkout(currentDate)
                            ?.setForceCompleteExercise(completeExercise.key, true);
                        if (completeExercise.isCompleted && completeWorkout != null && completeWorkout.isCompleted) {
                          final currentActiveCycle = ref.watch(fetchCyclesControllerProvider).currentActiveCycle;
                          final cycleNum = currentActiveCycle.key;
                          final dayNum = DateTime(currentDate.year, currentDate.month, currentDate.day)
                              .difference(DateTime(currentActiveCycle.startDate.year, currentActiveCycle.startDate.month,
                                  currentActiveCycle.startDate.day))
                              .inDays;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return WarningDialog(
                                action: context.appTexts.complete.toLowerCase(),
                                title: context.appTexts.workout.toLowerCase(),
                                additionalWarning: context.appTexts.actionIrreversible,
                                onConfirm: () {
                                  ref.read(editWorkoutExerciseControllerProvider.notifier).completeSet(
                                        set,
                                        workout!,
                                        value,
                                      );
                                  ref.read(editWorkoutExerciseControllerProvider.notifier).setExercise(null);
                                  ref
                                      .read(editWorkoutsControllerProvider.notifier)
                                      .completeWorkout(completeWorkout, int.parse(cycleNum), dayNum);
                                },
                              );
                            },
                          );
                        } else {
                          ref.read(editWorkoutExerciseControllerProvider.notifier).completeSet(
                                set,
                                workout!,
                                value,
                              );
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomSetInputField extends HookWidget {
  const _CustomSetInputField({
    required this.onEditingComplete,
    required this.controller,
  });

  final Function(String) onEditingComplete;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        onEditingComplete(controller.text);
      }
    });

    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
      child: SizedBox(
        width: context.percentOfWidth(0.1),
        child: Transform.translate(
          offset: const Offset(0, -7),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            onEditingComplete: onEditingComplete(controller.text),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
          ),
        ),
      ),
    );
  }
}

class _HMSPicker extends StatefulWidget {
  final int initialTimeInSeconds;

  const _HMSPicker({Key? key, required this.initialTimeInSeconds}) : super(key: key);

  @override
  _HMSPickerState createState() => _HMSPickerState();
}

class _HMSPickerState extends State<_HMSPicker> {
  late int hours;
  late int minutes;
  late int seconds;

  late FixedExtentScrollController hoursController;
  late FixedExtentScrollController minutesController;
  late FixedExtentScrollController secondsController;

  @override
  void initState() {
    super.initState();
    int remainingSeconds = widget.initialTimeInSeconds;
    hours = remainingSeconds ~/ 3600;
    remainingSeconds %= 3600;
    minutes = remainingSeconds ~/ 60;
    remainingSeconds %= 60;
    seconds = remainingSeconds;

    hoursController = FixedExtentScrollController(initialItem: hours);
    minutesController = FixedExtentScrollController(initialItem: minutes);
    secondsController = FixedExtentScrollController(initialItem: seconds);
  }

  @override
  void dispose() {
    hoursController.dispose();
    minutesController.dispose();
    secondsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPicker('Hours', hours, 23, hoursController, (value) => setState(() => hours = value)),
              _buildPicker('Minutes', minutes, 59, minutesController, (value) => setState(() => minutes = value)),
              _buildPicker('Seconds', seconds, 59, secondsController, (value) => setState(() => seconds = value)),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextButton(
            text: context.appTexts.confirm,
            width: 150,
            height: 45,
            onPressed: () => Navigator.of(context).pop(hours * 3600 + minutes * 60 + seconds),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildPicker(
      String label, int initialValue, int maxValue, FixedExtentScrollController controller, ValueChanged<int> onChanged) {
    return Column(
      children: [
        Text(label, style: context.textTheme.titleMedium),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 150,
            width: 60,
            child: ListWheelScrollView.useDelegate(
              controller: controller,
              itemExtent: 40,
              onSelectedItemChanged: onChanged,
              overAndUnderCenterOpacity: 0.6,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) => Center(
                    child: Text(
                  index.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                )),
                childCount: maxValue + 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
