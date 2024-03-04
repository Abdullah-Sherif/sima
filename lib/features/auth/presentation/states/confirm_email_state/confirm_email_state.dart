
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/auth/domain/barrel.dart';

part 'confirm_email_state.freezed.dart';

@freezed
class ConfirmEmailState with _$ConfirmEmailState {
  const ConfirmEmailState._();

  const factory ConfirmEmailState({
    @Default(ConfirmEmailStatus.initial) ConfirmEmailStatus status,
    @Default(Duration.zero) Duration timeUntilEnableResend,
    User? user,
    AuthFailure? failure,
  }) = _ConfirmEmailState;

  bool get isResendEnabled => timeUntilEnableResend <= Duration.zero;
}

enum ConfirmEmailStatus {
  initial,
  loading,
  sent,
  verified,
  sendFailure,
  verifyFailure,
}

extension ConfirmEmailStatusX on ConfirmEmailStatus {
  bool get isInitial => this == ConfirmEmailStatus.initial;
  bool get isLoading => this == ConfirmEmailStatus.loading;
  bool get isSent => this == ConfirmEmailStatus.sent;
  bool get isVerified => this == ConfirmEmailStatus.verified;
  bool get isSendFailure => this == ConfirmEmailStatus.sendFailure;
  bool get isVerifyFailure => this == ConfirmEmailStatus.verifyFailure;
}
