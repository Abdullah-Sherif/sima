import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

import 'signup_state.dart';

final signupControllerProvider = StateNotifierProvider.autoDispose<SignupController, SignupState>((ref) {
  return SignupController(
    const SignupState(
      email: EmailInput.pure(),
      password: PasswordInput.pure(),
    ),
    ref.watch(authRepositoryProvider),
  );
});

class SignupController extends StateNotifier<SignupState> {
  SignupController(
    SignupState state,
    this.authRepository,
  ) : super(state);

  final AuthRepository authRepository;

  void emailChanged(String value) {
    state = state.copyWith(
      email: EmailInput.pure(value),
    );
  }

  void passwordChanged(String value) {
    state = state.copyWith(
      password: PasswordInput.pure(value: value),
    );
  }

  void signup() async {
    if (state.signupStatus.isInProgressOrSuccess) return;

    state = state.copyWith(
      email: EmailInput.dirty(state.email.value),
      password: PasswordInput.dirty(state.password.value),
    );

    if (state.email.isNotValid || state.password.isNotValid) return;

    state = state.copyWith(signupStatus: FetchStatus.loading);

    final result = await authRepository.createUser(
      CreateUserParams(
        email: state.email.value,
        password: state.password.value,
      ),
    );

    if (!mounted) return;

    state = state.copyWith(
      signupStatus: result.fold(
        (failure) => FetchStatus.failure,
        (success) => FetchStatus.success,
      ),
    );
  }
}
