// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutEntity _$WorkoutEntityFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'workoutDay':
      return _WorkoutDay.fromJson(json);
    case 'restDay':
      return _RestDay.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'WorkoutEntity',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$WorkoutEntity {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
  String get key => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, ExerciseEntity> exercises,
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key,
            @JsonKey(
                name: 'force_completed',
                fromJson: _intToBool,
                toJson: _boolToInt)
            bool forceCompleted)
        workoutDay,
    required TResult Function(
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key)
        restDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Map<String, ExerciseEntity> exercises,
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key,
            @JsonKey(
                name: 'force_completed',
                fromJson: _intToBool,
                toJson: _boolToInt)
            bool forceCompleted)?
        workoutDay,
    TResult? Function(
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key)?
        restDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, ExerciseEntity> exercises,
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key,
            @JsonKey(
                name: 'force_completed',
                fromJson: _intToBool,
                toJson: _boolToInt)
            bool forceCompleted)?
        workoutDay,
    TResult Function(
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key)?
        restDay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WorkoutDay value) workoutDay,
    required TResult Function(_RestDay value) restDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WorkoutDay value)? workoutDay,
    TResult? Function(_RestDay value)? restDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WorkoutDay value)? workoutDay,
    TResult Function(_RestDay value)? restDay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutEntityCopyWith<WorkoutEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutEntityCopyWith<$Res> {
  factory $WorkoutEntityCopyWith(
          WorkoutEntity value, $Res Function(WorkoutEntity) then) =
      _$WorkoutEntityCopyWithImpl<$Res, WorkoutEntity>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      String key});
}

/// @nodoc
class _$WorkoutEntityCopyWithImpl<$Res, $Val extends WorkoutEntity>
    implements $WorkoutEntityCopyWith<$Res> {
  _$WorkoutEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutDayImplCopyWith<$Res>
    implements $WorkoutEntityCopyWith<$Res> {
  factory _$$WorkoutDayImplCopyWith(
          _$WorkoutDayImpl value, $Res Function(_$WorkoutDayImpl) then) =
      __$$WorkoutDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, ExerciseEntity> exercises,
      String name,
      @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      String key,
      @JsonKey(
          name: 'force_completed', fromJson: _intToBool, toJson: _boolToInt)
      bool forceCompleted});
}

/// @nodoc
class __$$WorkoutDayImplCopyWithImpl<$Res>
    extends _$WorkoutEntityCopyWithImpl<$Res, _$WorkoutDayImpl>
    implements _$$WorkoutDayImplCopyWith<$Res> {
  __$$WorkoutDayImplCopyWithImpl(
      _$WorkoutDayImpl _value, $Res Function(_$WorkoutDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercises = null,
    Object? name = null,
    Object? key = null,
    Object? forceCompleted = null,
  }) {
    return _then(_$WorkoutDayImpl(
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as Map<String, ExerciseEntity>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      forceCompleted: null == forceCompleted
          ? _value.forceCompleted
          : forceCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutDayImpl implements _WorkoutDay {
  _$WorkoutDayImpl(
      {final Map<String, ExerciseEntity> exercises =
          const <String, ExerciseEntity>{},
      required this.name,
      @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      required this.key,
      @JsonKey(
          name: 'force_completed', fromJson: _intToBool, toJson: _boolToInt)
      this.forceCompleted = false,
      final String? $type})
      : _exercises = exercises,
        $type = $type ?? 'workoutDay';

  factory _$WorkoutDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutDayImplFromJson(json);

  final Map<String, ExerciseEntity> _exercises;
  @override
  @JsonKey()
  Map<String, ExerciseEntity> get exercises {
    if (_exercises is EqualUnmodifiableMapView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_exercises);
  }

  @override
  final String name;
  @override
  @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
  final String key;
  @override
  @JsonKey(name: 'force_completed', fromJson: _intToBool, toJson: _boolToInt)
  final bool forceCompleted;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'WorkoutEntity.workoutDay(exercises: $exercises, name: $name, key: $key, forceCompleted: $forceCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutDayImpl &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.forceCompleted, forceCompleted) ||
                other.forceCompleted == forceCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_exercises),
      name,
      key,
      forceCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutDayImplCopyWith<_$WorkoutDayImpl> get copyWith =>
      __$$WorkoutDayImplCopyWithImpl<_$WorkoutDayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, ExerciseEntity> exercises,
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key,
            @JsonKey(
                name: 'force_completed',
                fromJson: _intToBool,
                toJson: _boolToInt)
            bool forceCompleted)
        workoutDay,
    required TResult Function(
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key)
        restDay,
  }) {
    return workoutDay(exercises, name, key, forceCompleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Map<String, ExerciseEntity> exercises,
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key,
            @JsonKey(
                name: 'force_completed',
                fromJson: _intToBool,
                toJson: _boolToInt)
            bool forceCompleted)?
        workoutDay,
    TResult? Function(
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key)?
        restDay,
  }) {
    return workoutDay?.call(exercises, name, key, forceCompleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, ExerciseEntity> exercises,
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key,
            @JsonKey(
                name: 'force_completed',
                fromJson: _intToBool,
                toJson: _boolToInt)
            bool forceCompleted)?
        workoutDay,
    TResult Function(
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key)?
        restDay,
    required TResult orElse(),
  }) {
    if (workoutDay != null) {
      return workoutDay(exercises, name, key, forceCompleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WorkoutDay value) workoutDay,
    required TResult Function(_RestDay value) restDay,
  }) {
    return workoutDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WorkoutDay value)? workoutDay,
    TResult? Function(_RestDay value)? restDay,
  }) {
    return workoutDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WorkoutDay value)? workoutDay,
    TResult Function(_RestDay value)? restDay,
    required TResult orElse(),
  }) {
    if (workoutDay != null) {
      return workoutDay(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutDayImplToJson(
      this,
    );
  }
}

abstract class _WorkoutDay implements WorkoutEntity {
  factory _WorkoutDay(
      {final Map<String, ExerciseEntity> exercises,
      required final String name,
      @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      required final String key,
      @JsonKey(
          name: 'force_completed', fromJson: _intToBool, toJson: _boolToInt)
      final bool forceCompleted}) = _$WorkoutDayImpl;

  factory _WorkoutDay.fromJson(Map<String, dynamic> json) =
      _$WorkoutDayImpl.fromJson;

  Map<String, ExerciseEntity> get exercises;
  @override
  String get name;
  @override
  @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
  String get key;
  @JsonKey(name: 'force_completed', fromJson: _intToBool, toJson: _boolToInt)
  bool get forceCompleted;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutDayImplCopyWith<_$WorkoutDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestDayImplCopyWith<$Res>
    implements $WorkoutEntityCopyWith<$Res> {
  factory _$$RestDayImplCopyWith(
          _$RestDayImpl value, $Res Function(_$RestDayImpl) then) =
      __$$RestDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      String key});
}

/// @nodoc
class __$$RestDayImplCopyWithImpl<$Res>
    extends _$WorkoutEntityCopyWithImpl<$Res, _$RestDayImpl>
    implements _$$RestDayImplCopyWith<$Res> {
  __$$RestDayImplCopyWithImpl(
      _$RestDayImpl _value, $Res Function(_$RestDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
  }) {
    return _then(_$RestDayImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestDayImpl implements _RestDay {
  const _$RestDayImpl(
      {this.name = 'Rest',
      @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      required this.key,
      final String? $type})
      : $type = $type ?? 'restDay';

  factory _$RestDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestDayImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
  final String key;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'WorkoutEntity.restDay(name: $name, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestDayImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestDayImplCopyWith<_$RestDayImpl> get copyWith =>
      __$$RestDayImplCopyWithImpl<_$RestDayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, ExerciseEntity> exercises,
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key,
            @JsonKey(
                name: 'force_completed',
                fromJson: _intToBool,
                toJson: _boolToInt)
            bool forceCompleted)
        workoutDay,
    required TResult Function(
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key)
        restDay,
  }) {
    return restDay(name, key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Map<String, ExerciseEntity> exercises,
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key,
            @JsonKey(
                name: 'force_completed',
                fromJson: _intToBool,
                toJson: _boolToInt)
            bool forceCompleted)?
        workoutDay,
    TResult? Function(
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key)?
        restDay,
  }) {
    return restDay?.call(name, key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, ExerciseEntity> exercises,
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key,
            @JsonKey(
                name: 'force_completed',
                fromJson: _intToBool,
                toJson: _boolToInt)
            bool forceCompleted)?
        workoutDay,
    TResult Function(
            String name,
            @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
            String key)?
        restDay,
    required TResult orElse(),
  }) {
    if (restDay != null) {
      return restDay(name, key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WorkoutDay value) workoutDay,
    required TResult Function(_RestDay value) restDay,
  }) {
    return restDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WorkoutDay value)? workoutDay,
    TResult? Function(_RestDay value)? restDay,
  }) {
    return restDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WorkoutDay value)? workoutDay,
    TResult Function(_RestDay value)? restDay,
    required TResult orElse(),
  }) {
    if (restDay != null) {
      return restDay(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RestDayImplToJson(
      this,
    );
  }
}

abstract class _RestDay implements WorkoutEntity {
  const factory _RestDay(
      {final String name,
      @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
      required final String key}) = _$RestDayImpl;

  factory _RestDay.fromJson(Map<String, dynamic> json) = _$RestDayImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'id', fromJson: _toString, includeToJson: false)
  String get key;
  @override
  @JsonKey(ignore: true)
  _$$RestDayImplCopyWith<_$RestDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
