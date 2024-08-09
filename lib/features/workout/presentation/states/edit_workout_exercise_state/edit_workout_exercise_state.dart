import 'package:equatable/equatable.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class EditWorkoutExerciseState extends Equatable {
  const EditWorkoutExerciseState({
    this.status = FetchStatus.initial,
    this.activeExercise,
  });

  final FetchStatus status;
  final ExerciseEntity? activeExercise;

  EditWorkoutExerciseState copyWith({
    FetchStatus? status,
    ExerciseEntity? activeExercise,
  }) {
    return EditWorkoutExerciseState(
      status: status ?? this.status,
      activeExercise: activeExercise ?? this.activeExercise,
    );
  }

  @override
  List<dynamic> get props => [status, activeExercise];
}
