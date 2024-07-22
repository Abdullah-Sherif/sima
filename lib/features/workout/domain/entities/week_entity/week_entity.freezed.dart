// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeekEntity _$WeekEntityFromJson(Map<String, dynamic> json) {
  return _WeekEntity.fromJson(json);
}

/// @nodoc
mixin _$WeekEntity {
  int get currentWeekNumber => throw _privateConstructorUsedError;
  int get currentDayNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeekEntityCopyWith<WeekEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekEntityCopyWith<$Res> {
  factory $WeekEntityCopyWith(
          WeekEntity value, $Res Function(WeekEntity) then) =
      _$WeekEntityCopyWithImpl<$Res, WeekEntity>;
  @useResult
  $Res call({int currentWeekNumber, int currentDayNumber});
}

/// @nodoc
class _$WeekEntityCopyWithImpl<$Res, $Val extends WeekEntity>
    implements $WeekEntityCopyWith<$Res> {
  _$WeekEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentWeekNumber = null,
    Object? currentDayNumber = null,
  }) {
    return _then(_value.copyWith(
      currentWeekNumber: null == currentWeekNumber
          ? _value.currentWeekNumber
          : currentWeekNumber // ignore: cast_nullable_to_non_nullable
              as int,
      currentDayNumber: null == currentDayNumber
          ? _value.currentDayNumber
          : currentDayNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekEntityImplCopyWith<$Res>
    implements $WeekEntityCopyWith<$Res> {
  factory _$$WeekEntityImplCopyWith(
          _$WeekEntityImpl value, $Res Function(_$WeekEntityImpl) then) =
      __$$WeekEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentWeekNumber, int currentDayNumber});
}

/// @nodoc
class __$$WeekEntityImplCopyWithImpl<$Res>
    extends _$WeekEntityCopyWithImpl<$Res, _$WeekEntityImpl>
    implements _$$WeekEntityImplCopyWith<$Res> {
  __$$WeekEntityImplCopyWithImpl(
      _$WeekEntityImpl _value, $Res Function(_$WeekEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentWeekNumber = null,
    Object? currentDayNumber = null,
  }) {
    return _then(_$WeekEntityImpl(
      currentWeekNumber: null == currentWeekNumber
          ? _value.currentWeekNumber
          : currentWeekNumber // ignore: cast_nullable_to_non_nullable
              as int,
      currentDayNumber: null == currentDayNumber
          ? _value.currentDayNumber
          : currentDayNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekEntityImpl implements _WeekEntity {
  _$WeekEntityImpl({this.currentWeekNumber = 1, this.currentDayNumber = 1});

  factory _$WeekEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekEntityImplFromJson(json);

  @override
  @JsonKey()
  final int currentWeekNumber;
  @override
  @JsonKey()
  final int currentDayNumber;

  @override
  String toString() {
    return 'WeekEntity(currentWeekNumber: $currentWeekNumber, currentDayNumber: $currentDayNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekEntityImpl &&
            (identical(other.currentWeekNumber, currentWeekNumber) ||
                other.currentWeekNumber == currentWeekNumber) &&
            (identical(other.currentDayNumber, currentDayNumber) ||
                other.currentDayNumber == currentDayNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentWeekNumber, currentDayNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekEntityImplCopyWith<_$WeekEntityImpl> get copyWith =>
      __$$WeekEntityImplCopyWithImpl<_$WeekEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekEntityImplToJson(
      this,
    );
  }
}

abstract class _WeekEntity implements WeekEntity {
  factory _WeekEntity(
      {final int currentWeekNumber,
      final int currentDayNumber}) = _$WeekEntityImpl;

  factory _WeekEntity.fromJson(Map<String, dynamic> json) =
      _$WeekEntityImpl.fromJson;

  @override
  int get currentWeekNumber;
  @override
  int get currentDayNumber;
  @override
  @JsonKey(ignore: true)
  _$$WeekEntityImplCopyWith<_$WeekEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
