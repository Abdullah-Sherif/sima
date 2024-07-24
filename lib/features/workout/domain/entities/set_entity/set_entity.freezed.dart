// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetEntity _$SetEntityFromJson(Map<String, dynamic> json) {
  return _SetEntity.fromJson(json);
}

/// @nodoc
mixin _$SetEntity {
  String get key => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetEntityCopyWith<SetEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetEntityCopyWith<$Res> {
  factory $SetEntityCopyWith(SetEntity value, $Res Function(SetEntity) then) =
      _$SetEntityCopyWithImpl<$Res, SetEntity>;
  @useResult
  $Res call({String key, int reps, int weight, bool isCompleted});
}

/// @nodoc
class _$SetEntityCopyWithImpl<$Res, $Val extends SetEntity>
    implements $SetEntityCopyWith<$Res> {
  _$SetEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? reps = null,
    Object? weight = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetEntityImplCopyWith<$Res>
    implements $SetEntityCopyWith<$Res> {
  factory _$$SetEntityImplCopyWith(
          _$SetEntityImpl value, $Res Function(_$SetEntityImpl) then) =
      __$$SetEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, int reps, int weight, bool isCompleted});
}

/// @nodoc
class __$$SetEntityImplCopyWithImpl<$Res>
    extends _$SetEntityCopyWithImpl<$Res, _$SetEntityImpl>
    implements _$$SetEntityImplCopyWith<$Res> {
  __$$SetEntityImplCopyWithImpl(
      _$SetEntityImpl _value, $Res Function(_$SetEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? reps = null,
    Object? weight = null,
    Object? isCompleted = null,
  }) {
    return _then(_$SetEntityImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetEntityImpl implements _SetEntity {
  _$SetEntityImpl(
      {required this.key,
      required this.reps,
      required this.weight,
      this.isCompleted = false});

  factory _$SetEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetEntityImplFromJson(json);

  @override
  final String key;
  @override
  final int reps;
  @override
  final int weight;
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'SetEntity(key: $key, reps: $reps, weight: $weight, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetEntityImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, reps, weight, isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetEntityImplCopyWith<_$SetEntityImpl> get copyWith =>
      __$$SetEntityImplCopyWithImpl<_$SetEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetEntityImplToJson(
      this,
    );
  }
}

abstract class _SetEntity implements SetEntity {
  factory _SetEntity(
      {required final String key,
      required final int reps,
      required final int weight,
      final bool isCompleted}) = _$SetEntityImpl;

  factory _SetEntity.fromJson(Map<String, dynamic> json) =
      _$SetEntityImpl.fromJson;

  @override
  String get key;
  @override
  int get reps;
  @override
  int get weight;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$SetEntityImplCopyWith<_$SetEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
