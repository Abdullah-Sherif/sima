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
  String get key => throw _privateConstructorUsedError;
  Map<String, SetEntity> get currentSets => throw _privateConstructorUsedError;
  ExerciseType get type => throw _privateConstructorUsedError;
  bool get forceCompleted => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  String? get videoPath => throw _privateConstructorUsedError;
  List<ExerciseLogEntity> get logs => throw _privateConstructorUsedError;

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
      String key,
      Map<String, SetEntity> currentSets,
      ExerciseType type,
      bool forceCompleted,
      bool isActive,
      int max,
      String? videoPath,
      List<ExerciseLogEntity> logs});
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
    Object? key = null,
    Object? currentSets = null,
    Object? type = null,
    Object? forceCompleted = null,
    Object? isActive = null,
    Object? max = null,
    Object? videoPath = freezed,
    Object? logs = null,
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
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      currentSets: null == currentSets
          ? _value.currentSets
          : currentSets // ignore: cast_nullable_to_non_nullable
              as Map<String, SetEntity>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ExerciseType,
      forceCompleted: null == forceCompleted
          ? _value.forceCompleted
          : forceCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      videoPath: freezed == videoPath
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<ExerciseLogEntity>,
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
      String key,
      Map<String, SetEntity> currentSets,
      ExerciseType type,
      bool forceCompleted,
      bool isActive,
      int max,
      String? videoPath,
      List<ExerciseLogEntity> logs});
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
    Object? key = null,
    Object? currentSets = null,
    Object? type = null,
    Object? forceCompleted = null,
    Object? isActive = null,
    Object? max = null,
    Object? videoPath = freezed,
    Object? logs = null,
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
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      currentSets: null == currentSets
          ? _value._currentSets
          : currentSets // ignore: cast_nullable_to_non_nullable
              as Map<String, SetEntity>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ExerciseType,
      forceCompleted: null == forceCompleted
          ? _value.forceCompleted
          : forceCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      videoPath: freezed == videoPath
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<ExerciseLogEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseEntityImpl implements _ExerciseEntity {
  const _$ExerciseEntityImpl(
      {required this.name,
      required this.description,
      required this.key,
      final Map<String, SetEntity> currentSets = const <String, SetEntity>{},
      this.type = ExerciseType.reps,
      this.forceCompleted = false,
      this.isActive = false,
      this.max = 10,
      this.videoPath = null,
      final List<ExerciseLogEntity> logs = const <ExerciseLogEntity>[]})
      : _currentSets = currentSets,
        _logs = logs;

  factory _$ExerciseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseEntityImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String key;
  final Map<String, SetEntity> _currentSets;
  @override
  @JsonKey()
  Map<String, SetEntity> get currentSets {
    if (_currentSets is EqualUnmodifiableMapView) return _currentSets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_currentSets);
  }

  @override
  @JsonKey()
  final ExerciseType type;
  @override
  @JsonKey()
  final bool forceCompleted;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final int max;
  @override
  @JsonKey()
  final String? videoPath;
  final List<ExerciseLogEntity> _logs;
  @override
  @JsonKey()
  List<ExerciseLogEntity> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  @override
  String toString() {
    return 'ExerciseEntity(name: $name, description: $description, key: $key, currentSets: $currentSets, type: $type, forceCompleted: $forceCompleted, isActive: $isActive, max: $max, videoPath: $videoPath, logs: $logs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality()
                .equals(other._currentSets, _currentSets) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.forceCompleted, forceCompleted) ||
                other.forceCompleted == forceCompleted) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.videoPath, videoPath) ||
                other.videoPath == videoPath) &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      key,
      const DeepCollectionEquality().hash(_currentSets),
      type,
      forceCompleted,
      isActive,
      max,
      videoPath,
      const DeepCollectionEquality().hash(_logs));

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
      required final String key,
      final Map<String, SetEntity> currentSets,
      final ExerciseType type,
      final bool forceCompleted,
      final bool isActive,
      final int max,
      final String? videoPath,
      final List<ExerciseLogEntity> logs}) = _$ExerciseEntityImpl;

  factory _ExerciseEntity.fromJson(Map<String, dynamic> json) =
      _$ExerciseEntityImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  String get key;
  @override
  Map<String, SetEntity> get currentSets;
  @override
  ExerciseType get type;
  @override
  bool get forceCompleted;
  @override
  bool get isActive;
  @override
  int get max;
  @override
  String? get videoPath;
  @override
  List<ExerciseLogEntity> get logs;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseEntityImplCopyWith<_$ExerciseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
