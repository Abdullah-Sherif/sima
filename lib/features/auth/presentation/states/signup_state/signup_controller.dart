import 'package:dartz/dartz.dart';
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

  Future<Either<Failure, Success>> signup() async {
    state = state.copyWith(
      email: EmailInput.dirty(state.email.value),
      password: PasswordInput.dirty(state.password.value),
    );

    final String? emailErrorMessages = state.email.error?.text;
    final String? passwordErrorMessages = state.password.error?.text;

    if (emailErrorMessages != null || passwordErrorMessages != null) {
      return left(const Failure('Invalid email or password'));
    } else {
      final result = await authRepository.createUser(
        CreateUserParams(
          email: state.email.value,
          password: state.password.value,
        ),
      );

      return result.fold(
        (failure) => left(failure),
        (success) => right(success),
      );
    }
  }
}
