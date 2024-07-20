import 'package:formz/formz.dart';

enum RetypeRequiredInputError { empty, notMatch }

class RetypeRequriedInput extends FormzInput<String, RetypeRequiredInputError> {
  const RetypeRequriedInput.pure([this.other = '', super.value = '']) : super.pure();

  const RetypeRequriedInput.dirty([this.other = '', super.value = '']) : super.dirty();

  final String other;

  @override
  RetypeRequiredInputError? validator(String value) {
    if (value.isEmpty) {
      return RetypeRequiredInputError.empty;
    } else if (value != other) {
      return RetypeRequiredInputError.notMatch;
    } else {
      return null;
    }
  }
}
