// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_cycles_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllCyclesState {
  CycleEntity get cycle => throw _privateConstructorUsedError;
  String get activeExerciseKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllCyclesStateCopyWith<AllCyclesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllCyclesStateCopyWith<$Res> {
  factory $AllCyclesStateCopyWith(
          AllCyclesState value, $Res Function(AllCyclesState) then) =
      _$AllCyclesStateCopyWithImpl<$Res, AllCyclesState>;
  @useResult
  $Res call({CycleEntity cycle, String activeExerciseKey});

  $CycleEntityCopyWith<$Res> get cycle;
}

/// @nodoc
class _$AllCyclesStateCopyWithImpl<$Res, $Val extends AllCyclesState>
    implements $AllCyclesStateCopyWith<$Res> {
  _$AllCyclesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cycle = null,
    Object? activeExerciseKey = null,
  }) {
    return _then(_value.copyWith(
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleEntity,
      activeExerciseKey: null == activeExerciseKey
          ? _value.activeExerciseKey
          : activeExerciseKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CycleEntityCopyWith<$Res> get cycle {
    return $CycleEntityCopyWith<$Res>(_value.cycle, (value) {
      return _then(_value.copyWith(cycle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AllCyclesStateImplCopyWith<$Res>
    implements $AllCyclesStateCopyWith<$Res> {
  factory _$$AllCyclesStateImplCopyWith(_$AllCyclesStateImpl value,
          $Res Function(_$AllCyclesStateImpl) then) =
      __$$AllCyclesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CycleEntity cycle, String activeExerciseKey});

  @override
  $CycleEntityCopyWith<$Res> get cycle;
}

/// @nodoc
class __$$AllCyclesStateImplCopyWithImpl<$Res>
    extends _$AllCyclesStateCopyWithImpl<$Res, _$AllCyclesStateImpl>
    implements _$$AllCyclesStateImplCopyWith<$Res> {
  __$$AllCyclesStateImplCopyWithImpl(
      _$AllCyclesStateImpl _value, $Res Function(_$AllCyclesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cycle = null,
    Object? activeExerciseKey = null,
  }) {
    return _then(_$AllCyclesStateImpl(
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as CycleEntity,
      activeExerciseKey: null == activeExerciseKey
          ? _value.activeExerciseKey
          : activeExerciseKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AllCyclesStateImpl implements _AllCyclesState {
  _$AllCyclesStateImpl({required this.cycle, this.activeExerciseKey = ''});

  @override
  final CycleEntity cycle;
  @override
  @JsonKey()
  final String activeExerciseKey;

  @override
  String toString() {
    return 'AllCyclesState(cycle: $cycle, activeExerciseKey: $activeExerciseKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllCyclesStateImpl &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.activeExerciseKey, activeExerciseKey) ||
                other.activeExerciseKey == activeExerciseKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cycle, activeExerciseKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllCyclesStateImplCopyWith<_$AllCyclesStateImpl> get copyWith =>
      __$$AllCyclesStateImplCopyWithImpl<_$AllCyclesStateImpl>(
          this, _$identity);
}

abstract class _AllCyclesState implements AllCyclesState {
  factory _AllCyclesState(
      {required final CycleEntity cycle,
      final String activeExerciseKey}) = _$AllCyclesStateImpl;

  @override
  CycleEntity get cycle;
  @override
  String get activeExerciseKey;
  @override
  @JsonKey(ignore: true)
  _$$AllCyclesStateImplCopyWith<_$AllCyclesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
