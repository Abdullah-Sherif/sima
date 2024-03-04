import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/auth/data/barrel.dart';
import 'login_state.dart';

final loginControllerProvider = StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  return LoginController(
    const LoginState(),
  );
});

class LoginController extends StateNotifier<LoginState> {
  LoginController(
    LoginState state,
  ) : super(state);

  void updateEmail(String email) {
    state = state.copyWith(emailInput: EmailInput.dirty(email));
  }

  void updatePassword(String password) {
    state = state.copyWith(passwordInput: PasswordInput.dirty(password));
  }

  void login() async {
    if (state.status.isInProgressOrSuccess) return;

    bool isEmailValid = Formz.validate([
      state.emailInput,
      state.passwordInput,
    ]);

    state = state.copyWith(
      status: isEmailValid ? FormzSubmissionStatus.inProgress : FormzSubmissionStatus.failure,
    );

    final result = await AuthRepository().loginWithEmailPassword(
      state.emailInput.value,
      state.passwordInput.value,
    );

    if (!mounted) return;

    result.fold(
      (l) => state = state.copyWith(status: FormzSubmissionStatus.failure),
      (r) => state = state.copyWith(status: FormzSubmissionStatus.success),
    );
  }
}
