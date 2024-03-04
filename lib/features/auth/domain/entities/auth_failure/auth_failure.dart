import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/core/barrel.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure extends Failure with _$AuthFailure {
  const AuthFailure._();

  const factory AuthFailure.invalidCode() = _InvalidCode;

  const factory AuthFailure.expiredCode() = _ExpiredCode;

  const factory AuthFailure.unknown({
    String? message,
  }) = _Unknown;

  const factory AuthFailure.emailInUse() = _EmailInUse;

  const factory AuthFailure.invalidPassword() = _InvalidPassword;

  const factory AuthFailure.invalidEmail() = _InvalidEmail;

  @override
  String? get message =>
      mapOrNull(
        unknown: (value) => value.message,
      ) ??
      super.message;
}
