import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

@RoutePage(name: 'WorkoutCycleRoute')
class WorkoutCyclePage extends HookConsumerWidget {
  const WorkoutCyclePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycle = ref.watch(allcyclesControllerProvider).cycle;
    final expandedCycle = useState(List.generate(cycle.workouts.length, (index) => false));

    useEffect(() {
      if (cycle.workouts.isNotEmpty) {
        expandedCycle.value = List.generate(cycle.workouts.length, (index) => false);
      }
      return null;
    }, [cycle.workouts.length]);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: context.theme.colorScheme.secondary,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const WorkoutDialog();
                },
              );
            },
            child: Icon(
              Icons.add,
              color: context.theme.colorScheme.background,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          leading: BackButton(
            style: ButtonStyle(iconSize: MaterialStateProperty.all(30)),
          ),
          title: Text(
            context.appTexts.workoutCycle,
            style: context.textTheme.titleLarge?.copyWith(fontSize: 35),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final workout = cycle.workouts.values.elementAt(index);
              return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: CustomWorkoutDayWidget(
                    dayNum: index + 1,
                    isExpanded: expandedCycle.value[index],
                    onExpand: () {
                      expandedCycle.value = List.generate(cycle.workouts.length, (listIndex) {
                        if (listIndex == index) {
                          return !expandedCycle.value[index];
                        }
                        return false;
                      });
                    },
                    workout: workout,
                  ));
            },
            itemCount: cycle.workouts.length,
          ),
        ),
      ),
    );
  }
}


