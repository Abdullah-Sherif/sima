// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CycleEntity _$CycleEntityFromJson(Map<String, dynamic> json) {
  return _CycleEntity.fromJson(json);
}

/// @nodoc
mixin _$CycleEntity {
  @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
  String get key => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'start_date_mse',
      fromJson: _getDateTimeFromMillisSinceEpoch,
      toJson: _getMillisSinceEpochFromDateTime)
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(toJson: _workoutsToJson, fromJson: _workoutsFromJson)
  Map<String, WorkoutEntity> get workouts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CycleEntityCopyWith<CycleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleEntityCopyWith<$Res> {
  factory $CycleEntityCopyWith(
          CycleEntity value, $Res Function(CycleEntity) then) =
      _$CycleEntityCopyWithImpl<$Res, CycleEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      String key,
      @JsonKey(
          name: 'start_date_mse',
          fromJson: _getDateTimeFromMillisSinceEpoch,
          toJson: _getMillisSinceEpochFromDateTime)
      DateTime startDate,
      @JsonKey(toJson: _workoutsToJson, fromJson: _workoutsFromJson)
      Map<String, WorkoutEntity> workouts});
}

/// @nodoc
class _$CycleEntityCopyWithImpl<$Res, $Val extends CycleEntity>
    implements $CycleEntityCopyWith<$Res> {
  _$CycleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? startDate = null,
    Object? workouts = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as Map<String, WorkoutEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CycleEntityImplCopyWith<$Res>
    implements $CycleEntityCopyWith<$Res> {
  factory _$$CycleEntityImplCopyWith(
          _$CycleEntityImpl value, $Res Function(_$CycleEntityImpl) then) =
      __$$CycleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      String key,
      @JsonKey(
          name: 'start_date_mse',
          fromJson: _getDateTimeFromMillisSinceEpoch,
          toJson: _getMillisSinceEpochFromDateTime)
      DateTime startDate,
      @JsonKey(toJson: _workoutsToJson, fromJson: _workoutsFromJson)
      Map<String, WorkoutEntity> workouts});
}

/// @nodoc
class __$$CycleEntityImplCopyWithImpl<$Res>
    extends _$CycleEntityCopyWithImpl<$Res, _$CycleEntityImpl>
    implements _$$CycleEntityImplCopyWith<$Res> {
  __$$CycleEntityImplCopyWithImpl(
      _$CycleEntityImpl _value, $Res Function(_$CycleEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? startDate = null,
    Object? workouts = null,
  }) {
    return _then(_$CycleEntityImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as Map<String, WorkoutEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CycleEntityImpl implements _CycleEntity {
  _$CycleEntityImpl(
      {@JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      required this.key,
      @JsonKey(
          name: 'start_date_mse',
          fromJson: _getDateTimeFromMillisSinceEpoch,
          toJson: _getMillisSinceEpochFromDateTime)
      required this.startDate,
      @JsonKey(toJson: _workoutsToJson, fromJson: _workoutsFromJson)
      final Map<String, WorkoutEntity> workouts =
          const <String, WorkoutEntity>{}})
      : _workouts = workouts;

  factory _$CycleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CycleEntityImplFromJson(json);

  @override
  @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
  final String key;
  @override
  @JsonKey(
      name: 'start_date_mse',
      fromJson: _getDateTimeFromMillisSinceEpoch,
      toJson: _getMillisSinceEpochFromDateTime)
  final DateTime startDate;
  final Map<String, WorkoutEntity> _workouts;
  @override
  @JsonKey(toJson: _workoutsToJson, fromJson: _workoutsFromJson)
  Map<String, WorkoutEntity> get workouts {
    if (_workouts is EqualUnmodifiableMapView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_workouts);
  }

  @override
  String toString() {
    return 'CycleEntity(key: $key, startDate: $startDate, workouts: $workouts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CycleEntityImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, startDate,
      const DeepCollectionEquality().hash(_workouts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CycleEntityImplCopyWith<_$CycleEntityImpl> get copyWith =>
      __$$CycleEntityImplCopyWithImpl<_$CycleEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CycleEntityImplToJson(
      this,
    );
  }
}

abstract class _CycleEntity implements CycleEntity {
  factory _CycleEntity(
      {@JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      required final String key,
      @JsonKey(
          name: 'start_date_mse',
          fromJson: _getDateTimeFromMillisSinceEpoch,
          toJson: _getMillisSinceEpochFromDateTime)
      required final DateTime startDate,
      @JsonKey(toJson: _workoutsToJson, fromJson: _workoutsFromJson)
      final Map<String, WorkoutEntity> workouts}) = _$CycleEntityImpl;

  factory _CycleEntity.fromJson(Map<String, dynamic> json) =
      _$CycleEntityImpl.fromJson;

  @override
  @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
  String get key;
  @override
  @JsonKey(
      name: 'start_date_mse',
      fromJson: _getDateTimeFromMillisSinceEpoch,
      toJson: _getMillisSinceEpochFromDateTime)
  DateTime get startDate;
  @override
  @JsonKey(toJson: _workoutsToJson, fromJson: _workoutsFromJson)
  Map<String, WorkoutEntity> get workouts;
  @override
  @JsonKey(ignore: true)
  _$$CycleEntityImplCopyWith<_$CycleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
