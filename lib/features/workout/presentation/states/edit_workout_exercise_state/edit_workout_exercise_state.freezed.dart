// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_workout_exercise_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditWorkoutExerciseState {
  FetchStatus get status => throw _privateConstructorUsedError;
  ExerciseEntity? get activeExercise => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditWorkoutExerciseStateCopyWith<EditWorkoutExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditWorkoutExerciseStateCopyWith<$Res> {
  factory $EditWorkoutExerciseStateCopyWith(EditWorkoutExerciseState value,
          $Res Function(EditWorkoutExerciseState) then) =
      _$EditWorkoutExerciseStateCopyWithImpl<$Res, EditWorkoutExerciseState>;
  @useResult
  $Res call({FetchStatus status, ExerciseEntity? activeExercise});

  $ExerciseEntityCopyWith<$Res>? get activeExercise;
}

/// @nodoc
class _$EditWorkoutExerciseStateCopyWithImpl<$Res,
        $Val extends EditWorkoutExerciseState>
    implements $EditWorkoutExerciseStateCopyWith<$Res> {
  _$EditWorkoutExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeExercise = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      activeExercise: freezed == activeExercise
          ? _value.activeExercise
          : activeExercise // ignore: cast_nullable_to_non_nullable
              as ExerciseEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseEntityCopyWith<$Res>? get activeExercise {
    if (_value.activeExercise == null) {
      return null;
    }

    return $ExerciseEntityCopyWith<$Res>(_value.activeExercise!, (value) {
      return _then(_value.copyWith(activeExercise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditWorkoutExerciseStateImplCopyWith<$Res>
    implements $EditWorkoutExerciseStateCopyWith<$Res> {
  factory _$$EditWorkoutExerciseStateImplCopyWith(
          _$EditWorkoutExerciseStateImpl value,
          $Res Function(_$EditWorkoutExerciseStateImpl) then) =
      __$$EditWorkoutExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FetchStatus status, ExerciseEntity? activeExercise});

  @override
  $ExerciseEntityCopyWith<$Res>? get activeExercise;
}

/// @nodoc
class __$$EditWorkoutExerciseStateImplCopyWithImpl<$Res>
    extends _$EditWorkoutExerciseStateCopyWithImpl<$Res,
        _$EditWorkoutExerciseStateImpl>
    implements _$$EditWorkoutExerciseStateImplCopyWith<$Res> {
  __$$EditWorkoutExerciseStateImplCopyWithImpl(
      _$EditWorkoutExerciseStateImpl _value,
      $Res Function(_$EditWorkoutExerciseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeExercise = freezed,
  }) {
    return _then(_$EditWorkoutExerciseStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FetchStatus,
      activeExercise: freezed == activeExercise
          ? _value.activeExercise
          : activeExercise // ignore: cast_nullable_to_non_nullable
              as ExerciseEntity?,
    ));
  }
}

/// @nodoc

class _$EditWorkoutExerciseStateImpl implements _EditWorkoutExerciseState {
  const _$EditWorkoutExerciseStateImpl(
      {this.status = FetchStatus.initial, this.activeExercise});

  @override
  @JsonKey()
  final FetchStatus status;
  @override
  final ExerciseEntity? activeExercise;

  @override
  String toString() {
    return 'EditWorkoutExerciseState(status: $status, activeExercise: $activeExercise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditWorkoutExerciseStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeExercise, activeExercise) ||
                other.activeExercise == activeExercise));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, activeExercise);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditWorkoutExerciseStateImplCopyWith<_$EditWorkoutExerciseStateImpl>
      get copyWith => __$$EditWorkoutExerciseStateImplCopyWithImpl<
          _$EditWorkoutExerciseStateImpl>(this, _$identity);
}

abstract class _EditWorkoutExerciseState implements EditWorkoutExerciseState {
  const factory _EditWorkoutExerciseState(
      {final FetchStatus status,
      final ExerciseEntity? activeExercise}) = _$EditWorkoutExerciseStateImpl;

  @override
  FetchStatus get status;
  @override
  ExerciseEntity? get activeExercise;
  @override
  @JsonKey(ignore: true)
  _$$EditWorkoutExerciseStateImplCopyWith<_$EditWorkoutExerciseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
