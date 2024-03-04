import 'package:equatable/equatable.dart';
import 'package:sima/core/barrel.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    RequiredInput? email,
    this.emailSubmissionStatus = FetchStatus.initial,
    this.passwordSubmissionStatus = FetchStatus.initial,
    this.checkPasswordCodeStatus = FetchStatus.initial,
    PasswordInput? password1,
    String? password2,
    this.code,
  })  : email = email ?? const RequiredInput.pure(),
        password1 = password1 ?? const PasswordInput.pure(),
        password2 = password2 ?? "";

  final RequiredInput email;
  final FetchStatus emailSubmissionStatus;
  final FetchStatus passwordSubmissionStatus;
  final FetchStatus checkPasswordCodeStatus;
  final PasswordInput password1;
  final String password2;
  final String? code;

  ResetPasswordState copyWith({
    RequiredInput? email,
    FetchStatus? emailSubmissionStatus,
    FetchStatus? passwordSubmissionStatus,
    FetchStatus? checkPasswordCodeStatus,
    PasswordInput? password1,
    String? password2,
    String? code,
  }) {
    return ResetPasswordState(
      email: email ?? this.email,
      emailSubmissionStatus: emailSubmissionStatus ?? this.emailSubmissionStatus,
      passwordSubmissionStatus: passwordSubmissionStatus ?? this.passwordSubmissionStatus,
      checkPasswordCodeStatus: checkPasswordCodeStatus ?? this.checkPasswordCodeStatus,
      password1: password1 ?? this.password1,
      password2: password2 ?? this.password2,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [
        email,
        emailSubmissionStatus,
        passwordSubmissionStatus,
        checkPasswordCodeStatus,
        password1,
        password2,
        code,
      ];
}
