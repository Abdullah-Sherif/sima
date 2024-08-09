import 'package:equatable/equatable.dart';
import 'package:sima/core/barrel.dart';

class EditExercisesState extends Equatable{
  const EditExercisesState({
    this.status = FetchStatus.initial,
  });

  final FetchStatus status;

  EditExercisesState copyWith({
    FetchStatus? status,
  }) {
    return EditExercisesState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}