// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChangePasswordState {
  dynamic get reauthenticationStatus => throw _privateConstructorUsedError;
  dynamic get changePasswordStatus => throw _privateConstructorUsedError;
  PasswordInput get currentPassword => throw _privateConstructorUsedError;
  PasswordInput get newPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangePasswordStateCopyWith<ChangePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordStateCopyWith<$Res> {
  factory $ChangePasswordStateCopyWith(
          ChangePasswordState value, $Res Function(ChangePasswordState) then) =
      _$ChangePasswordStateCopyWithImpl<$Res, ChangePasswordState>;
  @useResult
  $Res call(
      {dynamic reauthenticationStatus,
      dynamic changePasswordStatus,
      PasswordInput currentPassword,
      PasswordInput newPassword});
}

/// @nodoc
class _$ChangePasswordStateCopyWithImpl<$Res, $Val extends ChangePasswordState>
    implements $ChangePasswordStateCopyWith<$Res> {
  _$ChangePasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reauthenticationStatus = freezed,
    Object? changePasswordStatus = freezed,
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      reauthenticationStatus: freezed == reauthenticationStatus
          ? _value.reauthenticationStatus
          : reauthenticationStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      changePasswordStatus: freezed == changePasswordStatus
          ? _value.changePasswordStatus
          : changePasswordStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordStateImplCopyWith<$Res>
    implements $ChangePasswordStateCopyWith<$Res> {
  factory _$$ChangePasswordStateImplCopyWith(_$ChangePasswordStateImpl value,
          $Res Function(_$ChangePasswordStateImpl) then) =
      __$$ChangePasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic reauthenticationStatus,
      dynamic changePasswordStatus,
      PasswordInput currentPassword,
      PasswordInput newPassword});
}

/// @nodoc
class __$$ChangePasswordStateImplCopyWithImpl<$Res>
    extends _$ChangePasswordStateCopyWithImpl<$Res, _$ChangePasswordStateImpl>
    implements _$$ChangePasswordStateImplCopyWith<$Res> {
  __$$ChangePasswordStateImplCopyWithImpl(_$ChangePasswordStateImpl _value,
      $Res Function(_$ChangePasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reauthenticationStatus = freezed,
    Object? changePasswordStatus = freezed,
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_$ChangePasswordStateImpl(
      reauthenticationStatus: freezed == reauthenticationStatus
          ? _value.reauthenticationStatus!
          : reauthenticationStatus,
      changePasswordStatus: freezed == changePasswordStatus
          ? _value.changePasswordStatus!
          : changePasswordStatus,
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
    ));
  }
}

/// @nodoc

class _$ChangePasswordStateImpl implements _ChangePasswordState {
  const _$ChangePasswordStateImpl(
      {this.reauthenticationStatus = FetchStatus.initial,
      this.changePasswordStatus = FetchStatus.initial,
      this.currentPassword = const PasswordInput.pure(),
      this.newPassword = const PasswordInput.pure()});

  @override
  @JsonKey()
  final dynamic reauthenticationStatus;
  @override
  @JsonKey()
  final dynamic changePasswordStatus;
  @override
  @JsonKey()
  final PasswordInput currentPassword;
  @override
  @JsonKey()
  final PasswordInput newPassword;

  @override
  String toString() {
    return 'ChangePasswordState(reauthenticationStatus: $reauthenticationStatus, changePasswordStatus: $changePasswordStatus, currentPassword: $currentPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordStateImpl &&
            const DeepCollectionEquality()
                .equals(other.reauthenticationStatus, reauthenticationStatus) &&
            const DeepCollectionEquality()
                .equals(other.changePasswordStatus, changePasswordStatus) &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reauthenticationStatus),
      const DeepCollectionEquality().hash(changePasswordStatus),
      currentPassword,
      newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordStateImplCopyWith<_$ChangePasswordStateImpl> get copyWith =>
      __$$ChangePasswordStateImplCopyWithImpl<_$ChangePasswordStateImpl>(
          this, _$identity);
}

abstract class _ChangePasswordState implements ChangePasswordState {
  const factory _ChangePasswordState(
      {final dynamic reauthenticationStatus,
      final dynamic changePasswordStatus,
      final PasswordInput currentPassword,
      final PasswordInput newPassword}) = _$ChangePasswordStateImpl;

  @override
  dynamic get reauthenticationStatus;
  @override
  dynamic get changePasswordStatus;
  @override
  PasswordInput get currentPassword;
  @override
  PasswordInput get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$ChangePasswordStateImplCopyWith<_$ChangePasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
