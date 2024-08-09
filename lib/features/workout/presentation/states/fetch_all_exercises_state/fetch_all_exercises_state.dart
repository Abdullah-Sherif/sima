import 'package:equatable/equatable.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class FetchAllExercisesState extends Equatable {
  final List<ExerciseEntity> exercises;
  final FetchStatus status;

  const FetchAllExercisesState({
    this.exercises = const [],
    this.status = FetchStatus.initial,
  });

  FetchAllExercisesState copyWith({
    List<ExerciseEntity>? exercises,
    FetchStatus? status,
  }) {
    return FetchAllExercisesState(
      exercises: exercises ?? this.exercises,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [exercises, status];
}
