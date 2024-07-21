import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/barrel.dart';
import '../../../data/repositories/barrel.dart';
import 'reset_password_state.dart';

final resetPasswordProvider = StateNotifierProvider.autoDispose<ResetPasswordController, ResetPasswordState>((ref) {
  return ResetPasswordController(
    const ResetPasswordState(),
    ref.watch(authRepositoryProvider),
  );
});

class ResetPasswordController extends StateNotifier<ResetPasswordState> {
  ResetPasswordController(
    ResetPasswordState state,
    this.authRepository,
  ) : super(state);

  AuthRepository authRepository;

  void emailChanged(String value) {
    state = state.copyWith(
      email: RequiredInput.pure(value),
    );
  }

  void updateCode(String code) {
    state = state.copyWith(
      code: code,
    );
  }

  void sendPasswordResetEmail() async {
    if (state.emailSubmissionStatus.isInProgressOrSuccess) return;

    state = state.copyWith(
      email: RequiredInput.dirty(state.email.value),
      emailSubmissionStatus: FetchStatus.loading,
    );

    final String? emailErrorMessages = state.email.error?.errorMessage();

    if (emailErrorMessages != null) {
      state = state.copyWith(
        emailSubmissionStatus: FetchStatus.failure,
      );
    } else {
      final result = await authRepository.sendResetPassEmail(state.email.value);

      if (!mounted) return;

      state = state.copyWith(
        emailSubmissionStatus: result.fold(
          (failure) => FetchStatus.failure,
          (success) => FetchStatus.success,
        ),
      );
    }
  }

  void password1Changed(String value) {
    state = state.copyWith(password1: PasswordInput.pure(value: value));
  }

  void password2Changed(String value) {
    state = state.copyWith(password2: RetypeRequriedInput.pure(state.password1.value, value));
  }

  void checkPasswordCode() async {
    state = state.copyWith(
      checkPasswordCodeStatus: FetchStatus.loading,
    );
    final result = await authRepository.confirmResetPassCode(state.code!);

    if (!mounted) return;

    state = state.copyWith(
      checkPasswordCodeStatus: result.fold(
        (failure) => FetchStatus.failure,
        (success) => FetchStatus.success,
      ),
    );
  }

  void resetPassword() async {
    if (state.passwordSubmissionStatus.isInProgressOrSuccess) return;

    state = state.copyWith(
      password1: PasswordInput.dirty(state.password1.value),
      password2: RetypeRequriedInput.dirty(state.password1.value, state.password2.value),
    );

    if (state.password1.isNotValid || state.password2.isNotValid) return;

    state = state.copyWith(
      passwordSubmissionStatus: FetchStatus.loading,
    );

    final result = await authRepository.resetPassword(
      state.code!,
      state.password1.value,
    );

    if (!mounted) return;

    state = state.copyWith(
      passwordSubmissionStatus: result.fold(
        (failure) => FetchStatus.failure,
        (success) => FetchStatus.success,
      ),
    );
  }
}
