import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/features/barrel.dart';
import 'confirm_email_state.dart';

final confirmEmailControllerProvider = StateNotifierProvider.autoDispose<ConfirmEmailController, ConfirmEmailState>((ref) {
  return ConfirmEmailController(
    const ConfirmEmailState(),
    ref.watch(authRepositoryProvider),
  );
});

class ConfirmEmailController extends StateNotifier<ConfirmEmailState> {
  ConfirmEmailController(
    ConfirmEmailState state,
    this.authRepository,
  ) : super(state);

  final AuthRepository authRepository;

  static const _resendWaitDuration = Duration(seconds: 30);
  static const _resendWaitDurationFailed = Duration(seconds: 90);

  void initialize(User user) {
    state = state.copyWith(user: user);
  }

  Future<void> verifyEmail(String code) async {
    state = state.copyWith(status: ConfirmEmailStatus.loading, failure: null);

    final result = await authRepository.verifyEmail(code);

    if (!mounted) return;

    result.fold(
      (failure) {
        state = state.copyWith(
          status: ConfirmEmailStatus.verifyFailure,
          failure: failure,
        );
      },
      (success) {
        state = state.copyWith(
          status: ConfirmEmailStatus.verified,
          failure: null,
        );
      },
    );
  }

  Future<void> sendEmail() async {
    state = state.copyWith(status: ConfirmEmailStatus.loading, failure: null);

    final result = await authRepository.sendEmailVerification(state.user!);
    if (!mounted) return;

    result.fold(
      (failure) {
        state = state.copyWith(
          status: ConfirmEmailStatus.sendFailure,
          timeUntilEnableResend: _resendWaitDurationFailed,
          failure: failure,
        );
      },
      (success) {
        state = state.copyWith(
          status: ConfirmEmailStatus.sent,
          timeUntilEnableResend: _resendWaitDuration,
          failure: null,
        );
      },
    );

    _waitForResend();
  }

  void _waitForResend() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        final timeUntilEnableResend = state.timeUntilEnableResend - const Duration(seconds: 1);
        if (timeUntilEnableResend <= Duration.zero || !mounted) {
          timer.cancel();
        }

        state = state.copyWith(timeUntilEnableResend: timeUntilEnableResend);
      },
    );
  }
}
