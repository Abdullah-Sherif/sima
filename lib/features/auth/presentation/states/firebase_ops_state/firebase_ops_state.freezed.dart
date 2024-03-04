// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_ops_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FirebaseOpsState {
  String? get mode => throw _privateConstructorUsedError;
  String? get oobCode => throw _privateConstructorUsedError;
  String? get iKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirebaseOpsStateCopyWith<FirebaseOpsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseOpsStateCopyWith<$Res> {
  factory $FirebaseOpsStateCopyWith(
          FirebaseOpsState value, $Res Function(FirebaseOpsState) then) =
      _$FirebaseOpsStateCopyWithImpl<$Res, FirebaseOpsState>;
  @useResult
  $Res call({String? mode, String? oobCode, String? iKey});
}

/// @nodoc
class _$FirebaseOpsStateCopyWithImpl<$Res, $Val extends FirebaseOpsState>
    implements $FirebaseOpsStateCopyWith<$Res> {
  _$FirebaseOpsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = freezed,
    Object? oobCode = freezed,
    Object? iKey = freezed,
  }) {
    return _then(_value.copyWith(
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String?,
      oobCode: freezed == oobCode
          ? _value.oobCode
          : oobCode // ignore: cast_nullable_to_non_nullable
              as String?,
      iKey: freezed == iKey
          ? _value.iKey
          : iKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirebaseOpsStateImplCopyWith<$Res>
    implements $FirebaseOpsStateCopyWith<$Res> {
  factory _$$FirebaseOpsStateImplCopyWith(_$FirebaseOpsStateImpl value,
          $Res Function(_$FirebaseOpsStateImpl) then) =
      __$$FirebaseOpsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? mode, String? oobCode, String? iKey});
}

/// @nodoc
class __$$FirebaseOpsStateImplCopyWithImpl<$Res>
    extends _$FirebaseOpsStateCopyWithImpl<$Res, _$FirebaseOpsStateImpl>
    implements _$$FirebaseOpsStateImplCopyWith<$Res> {
  __$$FirebaseOpsStateImplCopyWithImpl(_$FirebaseOpsStateImpl _value,
      $Res Function(_$FirebaseOpsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = freezed,
    Object? oobCode = freezed,
    Object? iKey = freezed,
  }) {
    return _then(_$FirebaseOpsStateImpl(
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String?,
      oobCode: freezed == oobCode
          ? _value.oobCode
          : oobCode // ignore: cast_nullable_to_non_nullable
              as String?,
      iKey: freezed == iKey
          ? _value.iKey
          : iKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FirebaseOpsStateImpl implements _FirebaseOpsState {
  const _$FirebaseOpsStateImpl({this.mode, this.oobCode, this.iKey});

  @override
  final String? mode;
  @override
  final String? oobCode;
  @override
  final String? iKey;

  @override
  String toString() {
    return 'FirebaseOpsState(mode: $mode, oobCode: $oobCode, iKey: $iKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseOpsStateImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.oobCode, oobCode) || other.oobCode == oobCode) &&
            (identical(other.iKey, iKey) || other.iKey == iKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, oobCode, iKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseOpsStateImplCopyWith<_$FirebaseOpsStateImpl> get copyWith =>
      __$$FirebaseOpsStateImplCopyWithImpl<_$FirebaseOpsStateImpl>(
          this, _$identity);
}

abstract class _FirebaseOpsState implements FirebaseOpsState {
  const factory _FirebaseOpsState(
      {final String? mode,
      final String? oobCode,
      final String? iKey}) = _$FirebaseOpsStateImpl;

  @override
  String? get mode;
  @override
  String? get oobCode;
  @override
  String? get iKey;
  @override
  @JsonKey(ignore: true)
  _$$FirebaseOpsStateImplCopyWith<_$FirebaseOpsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
