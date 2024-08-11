import 'package:equatable/equatable.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class FetchWorkoutsState extends Equatable {
  const FetchWorkoutsState({
    this.status = FetchStatus.initial,
    this.workouts = const {},
  });

  final FetchStatus status;
  final Map<String, WorkoutEntity> workouts;

  FetchWorkoutsState copyWith({
    FetchStatus? status,
    Map<String, WorkoutEntity>? workouts,
  }) {
    return FetchWorkoutsState(
      status: status ?? this.status,
      workouts: workouts ?? this.workouts,
    );
  }

  @override
  List<Object> get props => [status, workouts];
}