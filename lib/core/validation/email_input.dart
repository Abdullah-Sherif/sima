import 'package:formz/formz.dart';

enum EmailInputError {
  empty('Email cannot be empty.');

  final String text;

  const EmailInputError(this.text);
}

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure([String? value]) : super.pure(value ?? '');
  const EmailInput.dirty(String value) : super.dirty(value);

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) return EmailInputError.empty;

    return null;
  }
}
