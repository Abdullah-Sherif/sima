// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeekState {
  WeekEntity get weekEntity => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeekStateCopyWith<WeekState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekStateCopyWith<$Res> {
  factory $WeekStateCopyWith(WeekState value, $Res Function(WeekState) then) =
      _$WeekStateCopyWithImpl<$Res, WeekState>;
  @useResult
  $Res call({WeekEntity weekEntity, int offset});

  $WeekEntityCopyWith<$Res> get weekEntity;
}

/// @nodoc
class _$WeekStateCopyWithImpl<$Res, $Val extends WeekState>
    implements $WeekStateCopyWith<$Res> {
  _$WeekStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekEntity = null,
    Object? offset = null,
  }) {
    return _then(_value.copyWith(
      weekEntity: null == weekEntity
          ? _value.weekEntity
          : weekEntity // ignore: cast_nullable_to_non_nullable
              as WeekEntity,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeekEntityCopyWith<$Res> get weekEntity {
    return $WeekEntityCopyWith<$Res>(_value.weekEntity, (value) {
      return _then(_value.copyWith(weekEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeekStateImplCopyWith<$Res>
    implements $WeekStateCopyWith<$Res> {
  factory _$$WeekStateImplCopyWith(
          _$WeekStateImpl value, $Res Function(_$WeekStateImpl) then) =
      __$$WeekStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeekEntity weekEntity, int offset});

  @override
  $WeekEntityCopyWith<$Res> get weekEntity;
}

/// @nodoc
class __$$WeekStateImplCopyWithImpl<$Res>
    extends _$WeekStateCopyWithImpl<$Res, _$WeekStateImpl>
    implements _$$WeekStateImplCopyWith<$Res> {
  __$$WeekStateImplCopyWithImpl(
      _$WeekStateImpl _value, $Res Function(_$WeekStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekEntity = null,
    Object? offset = null,
  }) {
    return _then(_$WeekStateImpl(
      weekEntity: null == weekEntity
          ? _value.weekEntity
          : weekEntity // ignore: cast_nullable_to_non_nullable
              as WeekEntity,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WeekStateImpl implements _WeekState {
  _$WeekStateImpl({required this.weekEntity, this.offset = 0});

  @override
  final WeekEntity weekEntity;
  @override
  @JsonKey()
  final int offset;

  @override
  String toString() {
    return 'WeekState(weekEntity: $weekEntity, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekStateImpl &&
            (identical(other.weekEntity, weekEntity) ||
                other.weekEntity == weekEntity) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weekEntity, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekStateImplCopyWith<_$WeekStateImpl> get copyWith =>
      __$$WeekStateImplCopyWithImpl<_$WeekStateImpl>(this, _$identity);
}

abstract class _WeekState implements WeekState {
  factory _WeekState({required final WeekEntity weekEntity, final int offset}) =
      _$WeekStateImpl;

  @override
  WeekEntity get weekEntity;
  @override
  int get offset;
  @override
  @JsonKey(ignore: true)
  _$$WeekStateImplCopyWith<_$WeekStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
