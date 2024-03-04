// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_email_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfirmEmailState {
  ConfirmEmailStatus get status => throw _privateConstructorUsedError;
  Duration get timeUntilEnableResend => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  AuthFailure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfirmEmailStateCopyWith<ConfirmEmailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmEmailStateCopyWith<$Res> {
  factory $ConfirmEmailStateCopyWith(
          ConfirmEmailState value, $Res Function(ConfirmEmailState) then) =
      _$ConfirmEmailStateCopyWithImpl<$Res, ConfirmEmailState>;
  @useResult
  $Res call(
      {ConfirmEmailStatus status,
      Duration timeUntilEnableResend,
      User? user,
      AuthFailure? failure});

  $AuthFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$ConfirmEmailStateCopyWithImpl<$Res, $Val extends ConfirmEmailState>
    implements $ConfirmEmailStateCopyWith<$Res> {
  _$ConfirmEmailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timeUntilEnableResend = null,
    Object? user = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConfirmEmailStatus,
      timeUntilEnableResend: null == timeUntilEnableResend
          ? _value.timeUntilEnableResend
          : timeUntilEnableResend // ignore: cast_nullable_to_non_nullable
              as Duration,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as AuthFailure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $AuthFailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfirmEmailStateImplCopyWith<$Res>
    implements $ConfirmEmailStateCopyWith<$Res> {
  factory _$$ConfirmEmailStateImplCopyWith(_$ConfirmEmailStateImpl value,
          $Res Function(_$ConfirmEmailStateImpl) then) =
      __$$ConfirmEmailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ConfirmEmailStatus status,
      Duration timeUntilEnableResend,
      User? user,
      AuthFailure? failure});

  @override
  $AuthFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$ConfirmEmailStateImplCopyWithImpl<$Res>
    extends _$ConfirmEmailStateCopyWithImpl<$Res, _$ConfirmEmailStateImpl>
    implements _$$ConfirmEmailStateImplCopyWith<$Res> {
  __$$ConfirmEmailStateImplCopyWithImpl(_$ConfirmEmailStateImpl _value,
      $Res Function(_$ConfirmEmailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timeUntilEnableResend = null,
    Object? user = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$ConfirmEmailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConfirmEmailStatus,
      timeUntilEnableResend: null == timeUntilEnableResend
          ? _value.timeUntilEnableResend
          : timeUntilEnableResend // ignore: cast_nullable_to_non_nullable
              as Duration,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as AuthFailure?,
    ));
  }
}

/// @nodoc

class _$ConfirmEmailStateImpl extends _ConfirmEmailState {
  const _$ConfirmEmailStateImpl(
      {this.status = ConfirmEmailStatus.initial,
      this.timeUntilEnableResend = Duration.zero,
      this.user,
      this.failure})
      : super._();

  @override
  @JsonKey()
  final ConfirmEmailStatus status;
  @override
  @JsonKey()
  final Duration timeUntilEnableResend;
  @override
  final User? user;
  @override
  final AuthFailure? failure;

  @override
  String toString() {
    return 'ConfirmEmailState(status: $status, timeUntilEnableResend: $timeUntilEnableResend, user: $user, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmEmailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timeUntilEnableResend, timeUntilEnableResend) ||
                other.timeUntilEnableResend == timeUntilEnableResend) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, timeUntilEnableResend, user, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmEmailStateImplCopyWith<_$ConfirmEmailStateImpl> get copyWith =>
      __$$ConfirmEmailStateImplCopyWithImpl<_$ConfirmEmailStateImpl>(
          this, _$identity);
}

abstract class _ConfirmEmailState extends ConfirmEmailState {
  const factory _ConfirmEmailState(
      {final ConfirmEmailStatus status,
      final Duration timeUntilEnableResend,
      final User? user,
      final AuthFailure? failure}) = _$ConfirmEmailStateImpl;
  const _ConfirmEmailState._() : super._();

  @override
  ConfirmEmailStatus get status;
  @override
  Duration get timeUntilEnableResend;
  @override
  User? get user;
  @override
  AuthFailure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$ConfirmEmailStateImplCopyWith<_$ConfirmEmailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
