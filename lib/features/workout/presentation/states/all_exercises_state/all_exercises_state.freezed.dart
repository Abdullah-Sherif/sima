// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_exercises_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllExercisesState {
  Map<String, ExerciseEntity> get exercises =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllExercisesStateCopyWith<AllExercisesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllExercisesStateCopyWith<$Res> {
  factory $AllExercisesStateCopyWith(
          AllExercisesState value, $Res Function(AllExercisesState) then) =
      _$AllExercisesStateCopyWithImpl<$Res, AllExercisesState>;
  @useResult
  $Res call({Map<String, ExerciseEntity> exercises});
}

/// @nodoc
class _$AllExercisesStateCopyWithImpl<$Res, $Val extends AllExercisesState>
    implements $AllExercisesStateCopyWith<$Res> {
  _$AllExercisesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as Map<String, ExerciseEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllExercisesStateImplCopyWith<$Res>
    implements $AllExercisesStateCopyWith<$Res> {
  factory _$$AllExercisesStateImplCopyWith(_$AllExercisesStateImpl value,
          $Res Function(_$AllExercisesStateImpl) then) =
      __$$AllExercisesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, ExerciseEntity> exercises});
}

/// @nodoc
class __$$AllExercisesStateImplCopyWithImpl<$Res>
    extends _$AllExercisesStateCopyWithImpl<$Res, _$AllExercisesStateImpl>
    implements _$$AllExercisesStateImplCopyWith<$Res> {
  __$$AllExercisesStateImplCopyWithImpl(_$AllExercisesStateImpl _value,
      $Res Function(_$AllExercisesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercises = null,
  }) {
    return _then(_$AllExercisesStateImpl(
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as Map<String, ExerciseEntity>,
    ));
  }
}

/// @nodoc

class _$AllExercisesStateImpl implements _AllExercisesState {
  _$AllExercisesStateImpl(
      {final Map<String, ExerciseEntity> exercises =
          const <String, ExerciseEntity>{}})
      : _exercises = exercises;

  final Map<String, ExerciseEntity> _exercises;
  @override
  @JsonKey()
  Map<String, ExerciseEntity> get exercises {
    if (_exercises is EqualUnmodifiableMapView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_exercises);
  }

  @override
  String toString() {
    return 'AllExercisesState(exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllExercisesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllExercisesStateImplCopyWith<_$AllExercisesStateImpl> get copyWith =>
      __$$AllExercisesStateImplCopyWithImpl<_$AllExercisesStateImpl>(
          this, _$identity);
}

abstract class _AllExercisesState implements AllExercisesState {
  factory _AllExercisesState({final Map<String, ExerciseEntity> exercises}) =
      _$AllExercisesStateImpl;

  @override
  Map<String, ExerciseEntity> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$AllExercisesStateImplCopyWith<_$AllExercisesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
