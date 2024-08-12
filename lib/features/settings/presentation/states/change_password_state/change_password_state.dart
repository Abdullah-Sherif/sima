import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/core/barrel.dart';

part 'change_password_state.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(FetchStatus.initial) reauthenticationStatus,
    @Default(FetchStatus.initial) changePasswordStatus,
    @Default(PasswordInput.pure()) PasswordInput currentPassword,
    @Default(PasswordInput.pure()) PasswordInput newPassword,
  }) = _ChangePasswordState;
}
