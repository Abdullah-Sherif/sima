import 'package:formz/formz.dart';

enum RequiredInputError {
  empty,
}

class RequiredInput extends FormzInput<String, RequiredInputError> {
  const RequiredInput.pure([String? value]) : super.pure(value ?? '');
  const RequiredInput.dirty(String value) : super.dirty(value);

  @override
  RequiredInputError? validator(String value) {
    if (value.isEmpty) return RequiredInputError.empty;

    return null;
  }
}

extension RequiredInputErrorX on RequiredInputError {
  String errorMessage() {
    switch (this) {
      case RequiredInputError.empty:
        return 'This field is required.';
    }
  }
}
