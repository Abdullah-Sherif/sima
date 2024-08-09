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
    final workoutKey = ref.watch(fetchCyclesControllerProvider.notifier).getWorkout(currentDate)!.key;

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
                    onChanged: (value) {
                      ref.read(editWorkoutExerciseControllerProvider.notifier).updateSetReps(
                            set,
                            workoutKey,
                            value != '' ? int.parse(value) : 0,
                          );
                    },
                  ),
                  _CustomSetInputField(
                    controller: weightController!,
                    onChanged: (value) {
                      ref.read(editWorkoutExerciseControllerProvider.notifier).updateSetWeight(
                            set,
                            workoutKey,
                            value != '' ? int.parse(value) : 0,
                          );
                    },
                  ),
                ] else
                  ...[],
                Checkbox(
                  value: set.isCompleted,
                  onChanged: (value) {
                    ref.read(editWorkoutExerciseControllerProvider.notifier).completeSet(
                          set,
                          workoutKey,
                          value,
                        );
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

class _CustomSetInputField extends StatelessWidget {
  const _CustomSetInputField({
    required this.onChanged,
    required this.controller,
  });

  final Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
      child: SizedBox(
        width: context.percentOfWidth(0.1),
        child: Transform.translate(
          offset: const Offset(0, -7),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
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
