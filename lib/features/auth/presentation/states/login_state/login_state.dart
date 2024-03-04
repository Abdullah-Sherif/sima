import 'package:formz/formz.dart';
import 'package:sima/core/barrel.dart';

class LoginState {
  final EmailInput emailInput;
  final PasswordInput passwordInput;
  final FormzSubmissionStatus status;

  const LoginState({
    this.emailInput = const EmailInput.pure(),
    this.passwordInput = const PasswordInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  LoginState copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      status: status ?? this.status,
    );
  }
}
