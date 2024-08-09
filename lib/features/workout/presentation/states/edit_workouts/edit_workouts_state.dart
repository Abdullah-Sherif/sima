import 'package:equatable/equatable.dart';
import 'package:sima/core/barrel.dart';

class EditWorkoutsState extends Equatable {
  const EditWorkoutsState({
    this.status = FetchStatus.initial,
  });

  final FetchStatus status;

  EditWorkoutsState copyWith({
    FetchStatus? status,
  }) {
    return EditWorkoutsState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}