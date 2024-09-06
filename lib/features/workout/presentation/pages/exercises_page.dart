import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

@RoutePage()
class ExercisesPage extends HookConsumerWidget {
  const ExercisesPage({super.key, this.currentExercises, this.workoutKey});

  final List<ExerciseEntity>? currentExercises;
  final String? workoutKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = currentExercises != null;
    final exercises = ref.watch(fetchAllExercisesControllerProvider).exercises;
    final selectedExercises =
        isEditing ? useState(List.generate(currentExercises!.length, (index) => currentExercises![index].key)) : null;

    final editExercisesStatus = ref.watch(editExercisesControllerProvider).status;
    final editWorkoutsStatus = ref.watch(editWorkoutsControllerProvider).status;

    final isSearchVisible = useState(false);
    final searchController = useTextEditingController();
    final filteredExercises = useState<List<ExerciseEntity>>(exercises);

    useEffect(() {
      if (editExercisesStatus == FetchStatus.failure || editWorkoutsStatus == FetchStatus.failure) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showSnackbar(context: context, text: context.appTexts.errorOccured);
        });
      }
      return null;
    }, [editExercisesStatus]);

    useEffect(() {
      final searchText = searchController.text.toLowerCase();
      filteredExercises.value = exercises.where((exercise) => exercise.name.toLowerCase().contains(searchText)).toList();

      return null;
    }, [exercises]);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: context.theme.colorScheme.secondary,
            onPressed: () {
              if (isEditing) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return WarningDialog(
                        action: context.appTexts.add.toLowerCase(),
                        title: context.appTexts.exercises.toLowerCase(),
                        onConfirm: () {
                          ref
                              .read(editWorkoutsControllerProvider.notifier)
                              .setExercisesToWorkout(workoutKey!, selectedExercises!.value);
                          Navigator.of(context).pop();
                        });
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const CustomCreateExerciseDialog();
                  },
                );
              }
            },
            child: Icon(
              isEditing ? Icons.check : Icons.add,
              color: context.theme.colorScheme.background,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          centerTitle: true,
          leading: BackButton(
            style: ButtonStyle(iconSize: MaterialStateProperty.all(30)),
          ),
          title: Text(
            context.appTexts.exercises,
            style: context.textTheme.titleLarge?.copyWith(fontSize: 35),
          ),
          actions: [
            IconButton(
              onPressed: () {
                isSearchVisible.value = !isSearchVisible.value;
                if (!isSearchVisible.value) {
                  searchController.clear();
                  filteredExercises.value = exercises;
                }
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isSearchVisible.value ? 60.0 : 0.0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextInput(
                    controller: searchController,
                    hintText: context.appTexts.search,
                    onChanged: (p0) {
                      filteredExercises.value = exercises.where((exercise) => exercise.name.toLowerCase().contains(p0)).toList();
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: editExercisesStatus != FetchStatus.loading
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: SizedBox(
                        height: context.percentOfSafeHeight(0.8),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final exercise = filteredExercises.value.elementAt(index);

                            return Column(
                              children: [
                                if (index != 0) const SizedBox(height: 10),
                                _CustomExerciseTile(
                                  exercise: exercise,
                                  isEditing: isEditing,
                                  selectedExercises: selectedExercises,
                                  exerciseIndex: index,
                                ),
                              ],
                            );
                          },
                          itemCount: filteredExercises.value.length,
                        ),
                      ),
                    )
                  : const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomExerciseTile extends StatelessWidget {
  const _CustomExerciseTile({
    required this.exercise,
    required this.isEditing,
    this.selectedExercises,
    required this.exerciseIndex,
  });

  final ExerciseEntity exercise;
  final bool isEditing;
  final ValueNotifier<List<String>>? selectedExercises;
  final int exerciseIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: FittedBox(
        fit: BoxFit.contain,
        child: TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(
                context.percentOfWidth(0.8),
                85,
              ),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              horizontal: 20,
            )),
            backgroundColor: MaterialStateProperty.all(
              isEditing && selectedExercises!.value.contains(exercise.key)
                  ? context.theme.colorScheme.primary
                  : Colors.transparent,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
            ),
          ),
          onPressed: () {
            if (isEditing) {
              if (!selectedExercises!.value.contains(exercise.key)) {
                selectedExercises!.value = [...selectedExercises!.value, exercise.key];
              } else {
                final newExercises = selectedExercises!.value.where((element) => element != exercise.key).toList();
                selectedExercises!.value = newExercises;
              }
            } else {
              context.router.push(
                ExerciseDetailRoute(
                  exerciseIndex: exerciseIndex,
                ),
              );
            }
          },
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  exercise.name,
                  style: context.textTheme.titleMedium,
                ),
                Text(
                  exercise.description,
                  style: context.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
