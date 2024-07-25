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
  switch (json['runtimeType']) {
    case 'weight':
      return _WeightSetEntity.fromJson(json);
    case 'duration':
      return _DurationSetEntity.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SetEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SetEntity {
  String get key => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String key, int reps, int weight, bool isCompleted)
        weight,
    required TResult Function(String key, int durationInSec, bool isCompleted)
        duration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key, int reps, int weight, bool isCompleted)?
        weight,
    TResult? Function(String key, int durationInSec, bool isCompleted)?
        duration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key, int reps, int weight, bool isCompleted)?
        weight,
    TResult Function(String key, int durationInSec, bool isCompleted)? duration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeightSetEntity value) weight,
    required TResult Function(_DurationSetEntity value) duration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeightSetEntity value)? weight,
    TResult? Function(_DurationSetEntity value)? duration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeightSetEntity value)? weight,
    TResult Function(_DurationSetEntity value)? duration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  $Res call({String key, bool isCompleted});
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
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeightSetEntityImplCopyWith<$Res>
    implements $SetEntityCopyWith<$Res> {
  factory _$$WeightSetEntityImplCopyWith(_$WeightSetEntityImpl value,
          $Res Function(_$WeightSetEntityImpl) then) =
      __$$WeightSetEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, int reps, int weight, bool isCompleted});
}

/// @nodoc
class __$$WeightSetEntityImplCopyWithImpl<$Res>
    extends _$SetEntityCopyWithImpl<$Res, _$WeightSetEntityImpl>
    implements _$$WeightSetEntityImplCopyWith<$Res> {
  __$$WeightSetEntityImplCopyWithImpl(
      _$WeightSetEntityImpl _value, $Res Function(_$WeightSetEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? reps = null,
    Object? weight = null,
    Object? isCompleted = null,
  }) {
    return _then(_$WeightSetEntityImpl(
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
class _$WeightSetEntityImpl implements _WeightSetEntity {
  _$WeightSetEntityImpl(
      {required this.key,
      required this.reps,
      required this.weight,
      this.isCompleted = false,
      final String? $type})
      : $type = $type ?? 'weight';

  factory _$WeightSetEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightSetEntityImplFromJson(json);

  @override
  final String key;
  @override
  final int reps;
  @override
  final int weight;
  @override
  @JsonKey()
  final bool isCompleted;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SetEntity.weight(key: $key, reps: $reps, weight: $weight, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightSetEntityImpl &&
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
  _$$WeightSetEntityImplCopyWith<_$WeightSetEntityImpl> get copyWith =>
      __$$WeightSetEntityImplCopyWithImpl<_$WeightSetEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String key, int reps, int weight, bool isCompleted)
        weight,
    required TResult Function(String key, int durationInSec, bool isCompleted)
        duration,
  }) {
    return weight(key, reps, this.weight, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key, int reps, int weight, bool isCompleted)?
        weight,
    TResult? Function(String key, int durationInSec, bool isCompleted)?
        duration,
  }) {
    return weight?.call(key, reps, this.weight, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key, int reps, int weight, bool isCompleted)?
        weight,
    TResult Function(String key, int durationInSec, bool isCompleted)? duration,
    required TResult orElse(),
  }) {
    if (weight != null) {
      return weight(key, reps, this.weight, isCompleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeightSetEntity value) weight,
    required TResult Function(_DurationSetEntity value) duration,
  }) {
    return weight(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeightSetEntity value)? weight,
    TResult? Function(_DurationSetEntity value)? duration,
  }) {
    return weight?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeightSetEntity value)? weight,
    TResult Function(_DurationSetEntity value)? duration,
    required TResult orElse(),
  }) {
    if (weight != null) {
      return weight(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightSetEntityImplToJson(
      this,
    );
  }
}

abstract class _WeightSetEntity implements SetEntity {
  factory _WeightSetEntity(
      {required final String key,
      required final int reps,
      required final int weight,
      final bool isCompleted}) = _$WeightSetEntityImpl;

  factory _WeightSetEntity.fromJson(Map<String, dynamic> json) =
      _$WeightSetEntityImpl.fromJson;

  @override
  String get key;
  int get reps;
  int get weight;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$WeightSetEntityImplCopyWith<_$WeightSetEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DurationSetEntityImplCopyWith<$Res>
    implements $SetEntityCopyWith<$Res> {
  factory _$$DurationSetEntityImplCopyWith(_$DurationSetEntityImpl value,
          $Res Function(_$DurationSetEntityImpl) then) =
      __$$DurationSetEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, int durationInSec, bool isCompleted});
}

/// @nodoc
class __$$DurationSetEntityImplCopyWithImpl<$Res>
    extends _$SetEntityCopyWithImpl<$Res, _$DurationSetEntityImpl>
    implements _$$DurationSetEntityImplCopyWith<$Res> {
  __$$DurationSetEntityImplCopyWithImpl(_$DurationSetEntityImpl _value,
      $Res Function(_$DurationSetEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? durationInSec = null,
    Object? isCompleted = null,
  }) {
    return _then(_$DurationSetEntityImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      durationInSec: null == durationInSec
          ? _value.durationInSec
          : durationInSec // ignore: cast_nullable_to_non_nullable
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
class _$DurationSetEntityImpl implements _DurationSetEntity {
  _$DurationSetEntityImpl(
      {required this.key,
      required this.durationInSec,
      this.isCompleted = false,
      final String? $type})
      : $type = $type ?? 'duration';

  factory _$DurationSetEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DurationSetEntityImplFromJson(json);

  @override
  final String key;
  @override
  final int durationInSec;
  @override
  @JsonKey()
  final bool isCompleted;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SetEntity.duration(key: $key, durationInSec: $durationInSec, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DurationSetEntityImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.durationInSec, durationInSec) ||
                other.durationInSec == durationInSec) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, durationInSec, isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DurationSetEntityImplCopyWith<_$DurationSetEntityImpl> get copyWith =>
      __$$DurationSetEntityImplCopyWithImpl<_$DurationSetEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String key, int reps, int weight, bool isCompleted)
        weight,
    required TResult Function(String key, int durationInSec, bool isCompleted)
        duration,
  }) {
    return duration(key, durationInSec, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key, int reps, int weight, bool isCompleted)?
        weight,
    TResult? Function(String key, int durationInSec, bool isCompleted)?
        duration,
  }) {
    return duration?.call(key, durationInSec, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key, int reps, int weight, bool isCompleted)?
        weight,
    TResult Function(String key, int durationInSec, bool isCompleted)? duration,
    required TResult orElse(),
  }) {
    if (duration != null) {
      return duration(key, durationInSec, isCompleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WeightSetEntity value) weight,
    required TResult Function(_DurationSetEntity value) duration,
  }) {
    return duration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WeightSetEntity value)? weight,
    TResult? Function(_DurationSetEntity value)? duration,
  }) {
    return duration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WeightSetEntity value)? weight,
    TResult Function(_DurationSetEntity value)? duration,
    required TResult orElse(),
  }) {
    if (duration != null) {
      return duration(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DurationSetEntityImplToJson(
      this,
    );
  }
}

abstract class _DurationSetEntity implements SetEntity {
  factory _DurationSetEntity(
      {required final String key,
      required final int durationInSec,
      final bool isCompleted}) = _$DurationSetEntityImpl;

  factory _DurationSetEntity.fromJson(Map<String, dynamic> json) =
      _$DurationSetEntityImpl.fromJson;

  @override
  String get key;
  int get durationInSec;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$DurationSetEntityImplCopyWith<_$DurationSetEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
