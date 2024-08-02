// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_log_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseLogEntity _$ExerciseLogEntityFromJson(Map<String, dynamic> json) {
  return _ExerciseLogEntity.fromJson(json);
}

/// @nodoc
mixin _$ExerciseLogEntity {
  List<SetEntity> get sets => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get cycleNum => throw _privateConstructorUsedError;
  int get dayNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseLogEntityCopyWith<ExerciseLogEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseLogEntityCopyWith<$Res> {
  factory $ExerciseLogEntityCopyWith(
          ExerciseLogEntity value, $Res Function(ExerciseLogEntity) then) =
      _$ExerciseLogEntityCopyWithImpl<$Res, ExerciseLogEntity>;
  @useResult
  $Res call({List<SetEntity> sets, DateTime date, int cycleNum, int dayNum});
}

/// @nodoc
class _$ExerciseLogEntityCopyWithImpl<$Res, $Val extends ExerciseLogEntity>
    implements $ExerciseLogEntityCopyWith<$Res> {
  _$ExerciseLogEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sets = null,
    Object? date = null,
    Object? cycleNum = null,
    Object? dayNum = null,
  }) {
    return _then(_value.copyWith(
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<SetEntity>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cycleNum: null == cycleNum
          ? _value.cycleNum
          : cycleNum // ignore: cast_nullable_to_non_nullable
              as int,
      dayNum: null == dayNum
          ? _value.dayNum
          : dayNum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseLogEntityImplCopyWith<$Res>
    implements $ExerciseLogEntityCopyWith<$Res> {
  factory _$$ExerciseLogEntityImplCopyWith(_$ExerciseLogEntityImpl value,
          $Res Function(_$ExerciseLogEntityImpl) then) =
      __$$ExerciseLogEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SetEntity> sets, DateTime date, int cycleNum, int dayNum});
}

/// @nodoc
class __$$ExerciseLogEntityImplCopyWithImpl<$Res>
    extends _$ExerciseLogEntityCopyWithImpl<$Res, _$ExerciseLogEntityImpl>
    implements _$$ExerciseLogEntityImplCopyWith<$Res> {
  __$$ExerciseLogEntityImplCopyWithImpl(_$ExerciseLogEntityImpl _value,
      $Res Function(_$ExerciseLogEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sets = null,
    Object? date = null,
    Object? cycleNum = null,
    Object? dayNum = null,
  }) {
    return _then(_$ExerciseLogEntityImpl(
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<SetEntity>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cycleNum: null == cycleNum
          ? _value.cycleNum
          : cycleNum // ignore: cast_nullable_to_non_nullable
              as int,
      dayNum: null == dayNum
          ? _value.dayNum
          : dayNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseLogEntityImpl implements _ExerciseLogEntity {
  _$ExerciseLogEntityImpl(
      {required final List<SetEntity> sets,
      required this.date,
      required this.cycleNum,
      required this.dayNum})
      : _sets = sets;

  factory _$ExerciseLogEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseLogEntityImplFromJson(json);

  final List<SetEntity> _sets;
  @override
  List<SetEntity> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  final DateTime date;
  @override
  final int cycleNum;
  @override
  final int dayNum;

  @override
  String toString() {
    return 'ExerciseLogEntity(sets: $sets, date: $date, cycleNum: $cycleNum, dayNum: $dayNum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseLogEntityImpl &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.cycleNum, cycleNum) ||
                other.cycleNum == cycleNum) &&
            (identical(other.dayNum, dayNum) || other.dayNum == dayNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_sets), date, cycleNum, dayNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseLogEntityImplCopyWith<_$ExerciseLogEntityImpl> get copyWith =>
      __$$ExerciseLogEntityImplCopyWithImpl<_$ExerciseLogEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseLogEntityImplToJson(
      this,
    );
  }
}

abstract class _ExerciseLogEntity implements ExerciseLogEntity {
  factory _ExerciseLogEntity(
      {required final List<SetEntity> sets,
      required final DateTime date,
      required final int cycleNum,
      required final int dayNum}) = _$ExerciseLogEntityImpl;

  factory _ExerciseLogEntity.fromJson(Map<String, dynamic> json) =
      _$ExerciseLogEntityImpl.fromJson;

  @override
  List<SetEntity> get sets;
  @override
  DateTime get date;
  @override
  int get cycleNum;
  @override
  int get dayNum;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseLogEntityImplCopyWith<_$ExerciseLogEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
