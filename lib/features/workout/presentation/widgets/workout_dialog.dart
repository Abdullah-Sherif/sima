import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';
import 'package:uuid/uuid.dart';

String? _getErrorMessage(String controllerText, BuildContext context) {
  if (controllerText.isEmpty) {
    return context.appTexts.fieldCantBeEmpty;
  }
  return null;
}

class WorkoutDialog extends HookConsumerWidget {
  const WorkoutDialog({
    super.key,
    this.currentWorkout,
  });

  final WorkoutEntity? currentWorkout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = useState(currentWorkout != null ? [currentWorkout!.isWorkoutDay, !currentWorkout!.isWorkoutDay] : [true, false]);
    final nameController = useTextEditingController(text: currentWorkout?.name);
    final nameError = useState<String?>(null);
    const uuid = Uuid();

    useEffect(() {
      void nameListener() {
        nameError.value = _getErrorMessage(nameController.text, context);
      }

      nameController.addListener(nameListener);

      return () {
        nameController.removeListener(nameListener);
      };
    }, [nameController]);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.appTexts.type,
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              CustomToggleButtons(selectedType: type, types: [context.appTexts.workoutDay, context.appTexts.restDay]),
              const SizedBox(height: 20),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: type.value[0] ? 130 : 0,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.appTexts.name,
                        style: context.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: CustomTextInput(
                          controller: nameController,
                          errorMessage: nameError.value,
                          underline: true,
                          width: context.percentOfWidth(0.6),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Center(
                child: CustomTextButton(
                  text: context.appTexts.confirm,
                  onPressed: () {
                    if (type.value[0]) {
                      if (nameController.text.isEmpty) {
                        nameError.value = _getErrorMessage(nameController.text, context);
                        return;
                      }
                      if (currentWorkout != null) {
                        ref
                            .read(allcyclesControllerProvider.notifier)
                            .updateWorkout(currentWorkout!.copyWith(name: nameController.text).changeToWorkoutDay());
                      } else {
                        ref
                            .read(allcyclesControllerProvider.notifier)
                            .addWorkout(WorkoutEntity.workoutDay(name: nameController.text, key: uuid.v4()));
                      }
                      Navigator.of(context).pop();
                    } else {
                      if (currentWorkout != null) {
                        ref
                            .read(allcyclesControllerProvider.notifier)
                            .updateWorkout(WorkoutEntity.restDay(key: currentWorkout!.key));
                      } else {
                        ref.read(allcyclesControllerProvider.notifier).addWorkout(WorkoutEntity.restDay(key: uuid.v4()));
                      }
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
