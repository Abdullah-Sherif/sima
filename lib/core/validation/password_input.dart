import 'package:formz/formz.dart';

enum PasswordInputError {
  empty('Password cannot be empty.');

  final String text;

  const PasswordInputError(this.text);
}

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure({String? value}) : super.pure(value ?? '');
  const PasswordInput.dirty(String value) : super.dirty(value);

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) return PasswordInputError.empty;

    return null;
  }
}
