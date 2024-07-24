// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseEntity _$ExerciseEntityFromJson(Map<String, dynamic> json) {
  return _ExerciseEntity.fromJson(json);
}

/// @nodoc
mixin _$ExerciseEntity {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, SetEntity> get sets => throw _privateConstructorUsedError;
  ExerciseType get type => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  bool get forceCompleted => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseEntityCopyWith<ExerciseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseEntityCopyWith<$Res> {
  factory $ExerciseEntityCopyWith(
          ExerciseEntity value, $Res Function(ExerciseEntity) then) =
      _$ExerciseEntityCopyWithImpl<$Res, ExerciseEntity>;
  @useResult
  $Res call(
      {String name,
      String description,
      Map<String, SetEntity> sets,
      ExerciseType type,
      String key,
      bool forceCompleted,
      bool isActive});
}

/// @nodoc
class _$ExerciseEntityCopyWithImpl<$Res, $Val extends ExerciseEntity>
    implements $ExerciseEntityCopyWith<$Res> {
  _$ExerciseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? sets = null,
    Object? type = null,
    Object? key = null,
    Object? forceCompleted = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as Map<String, SetEntity>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ExerciseType,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      forceCompleted: null == forceCompleted
          ? _value.forceCompleted
          : forceCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseEntityImplCopyWith<$Res>
    implements $ExerciseEntityCopyWith<$Res> {
  factory _$$ExerciseEntityImplCopyWith(_$ExerciseEntityImpl value,
          $Res Function(_$ExerciseEntityImpl) then) =
      __$$ExerciseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      Map<String, SetEntity> sets,
      ExerciseType type,
      String key,
      bool forceCompleted,
      bool isActive});
}

/// @nodoc
class __$$ExerciseEntityImplCopyWithImpl<$Res>
    extends _$ExerciseEntityCopyWithImpl<$Res, _$ExerciseEntityImpl>
    implements _$$ExerciseEntityImplCopyWith<$Res> {
  __$$ExerciseEntityImplCopyWithImpl(
      _$ExerciseEntityImpl _value, $Res Function(_$ExerciseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? sets = null,
    Object? type = null,
    Object? key = null,
    Object? forceCompleted = null,
    Object? isActive = null,
  }) {
    return _then(_$ExerciseEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as Map<String, SetEntity>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ExerciseType,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      forceCompleted: null == forceCompleted
          ? _value.forceCompleted
          : forceCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseEntityImpl implements _ExerciseEntity {
  const _$ExerciseEntityImpl(
      {required this.name,
      required this.description,
      final Map<String, SetEntity> sets = const <String, SetEntity>{},
      this.type = ExerciseType.reps,
      required this.key,
      this.forceCompleted = false,
      this.isActive = false})
      : _sets = sets;

  factory _$ExerciseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseEntityImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  final Map<String, SetEntity> _sets;
  @override
  @JsonKey()
  Map<String, SetEntity> get sets {
    if (_sets is EqualUnmodifiableMapView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sets);
  }

  @override
  @JsonKey()
  final ExerciseType type;
  @override
  final String key;
  @override
  @JsonKey()
  final bool forceCompleted;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'ExerciseEntity(name: $name, description: $description, sets: $sets, type: $type, key: $key, forceCompleted: $forceCompleted, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.forceCompleted, forceCompleted) ||
                other.forceCompleted == forceCompleted) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      const DeepCollectionEquality().hash(_sets),
      type,
      key,
      forceCompleted,
      isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseEntityImplCopyWith<_$ExerciseEntityImpl> get copyWith =>
      __$$ExerciseEntityImplCopyWithImpl<_$ExerciseEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseEntityImplToJson(
      this,
    );
  }
}

abstract class _ExerciseEntity implements ExerciseEntity {
  const factory _ExerciseEntity(
      {required final String name,
      required final String description,
      final Map<String, SetEntity> sets,
      final ExerciseType type,
      required final String key,
      final bool forceCompleted,
      final bool isActive}) = _$ExerciseEntityImpl;

  factory _ExerciseEntity.fromJson(Map<String, dynamic> json) =
      _$ExerciseEntityImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  Map<String, SetEntity> get sets;
  @override
  ExerciseType get type;
  @override
  String get key;
  @override
  bool get forceCompleted;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseEntityImplCopyWith<_$ExerciseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
