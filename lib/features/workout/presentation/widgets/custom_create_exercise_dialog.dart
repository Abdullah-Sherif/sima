import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

String? _getErrorMessage(String controllerText, BuildContext context) {
  if (controllerText.isEmpty) {
    return context.appTexts.fieldCantBeEmpty;
  }
  return null;
}

class CustomCreateExerciseDialog extends HookConsumerWidget {
  const CustomCreateExerciseDialog({super.key, this.initialExercise});

  final ExerciseEntity? initialExercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: initialExercise?.name);
    final descriptionController = useTextEditingController(text: initialExercise?.description);
    final selectedType = useState(initialExercise != null
        ? [initialExercise!.type == ExerciseType.reps, initialExercise!.type == ExerciseType.duration]
        : [true, false]);
    final numberOfSets = useState(initialExercise?.currentSets.length ?? 1);
    final nameError = useState<String?>(null);
    final descriptionError = useState<String?>(null);
    const uuid = Uuid();

    useEffect(() {
      void nameListener() {
        nameError.value = _getErrorMessage(nameController.text, context);
      }

      void descriptionListener() {
        descriptionError.value = _getErrorMessage(descriptionController.text, context);
      }

      nameController.addListener(nameListener);
      descriptionController.addListener(descriptionListener);

      return () {
        nameController.removeListener(nameListener);
        descriptionController.removeListener(descriptionListener);
      };
    }, [nameController, descriptionController]);

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
          child: SingleChildScrollView(
            child: SizedBox(
              width: context.percentOfWidth(0.8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.appTexts.name,
                    style: context.textTheme.titleLarge,
                  ),
                  Center(
                    child: CustomTextInput(
                      controller: nameController,
                      width: context.percentOfWidth(0.6),
                      underline: true,
                      errorMessage: nameError.value,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    context.appTexts.desc,
                    style: context.textTheme.titleLarge,
                  ),
                  Center(
                    child: CustomTextInput(
                      controller: descriptionController,
                      width: context.percentOfWidth(0.6),
                      underline: true,
                      errorMessage: descriptionError.value,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (initialExercise == null) ...[
                    Text(
                      context.appTexts.type,
                      style: context.textTheme.titleLarge,
                    ),
                    CustomToggleButtons(selectedType: selectedType, types: [context.appTexts.weight, context.appTexts.duration]),
                    const SizedBox(height: 20),
                  ],
                  Text(
                    context.appTexts.sets,
                    style: context.textTheme.titleLarge,
                  ),
                  _CustomNumberPicker(currentValue: numberOfSets),
                  const SizedBox(height: 20),
                  CustomTextButton(
                    text: initialExercise != null ? context.appTexts.updateExercise : context.appTexts.createExercise,
                    onPressed: initialExercise != null
                        ? () {
                            if (nameController.text.isEmpty || descriptionController.text.isEmpty) {
                              nameError.value = _getErrorMessage(nameController.text, context);
                              descriptionError.value = _getErrorMessage(descriptionController.text, context);
                              return;
                            }
                            ref.read(allexercisesControllerProvider.notifier).updateExercise(
                                  initialExercise!.key,
                                  nameController.text,
                                  descriptionController.text,
                                  numberOfSets.value,
                                );
                            Navigator.of(context).pop();
                          }
                        : () {
                            if (nameController.text.isEmpty || descriptionController.text.isEmpty) {
                              nameError.value = _getErrorMessage(nameController.text, context);
                              descriptionError.value = _getErrorMessage(descriptionController.text, context);
                              return;
                            }
                            final uniqueKey = uuid.v4();
                            ref.read(allexercisesControllerProvider.notifier).addWorkout(
                                  uniqueKey,
                                  nameController.text,
                                  descriptionController.text,
                                  selectedType.value[0] ? ExerciseType.reps : ExerciseType.duration,
                                  numberOfSets.value,
                                );
                            Navigator.of(context).pop();
                          },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomNumberPicker extends StatelessWidget {
  const _CustomNumberPicker({
    required this.currentValue,
  });

  final ValueNotifier<int> currentValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (currentValue.value > 1) {
                currentValue.value--;
              }
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: context.theme.colorScheme.secondary),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              currentValue.value.toString(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              if (currentValue.value < 10) {
                currentValue.value++;
              }
            },
          ),
        ],
      ),
    );
  }
}
