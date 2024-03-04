import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/core/barrel.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    required EmailInput email,
    required PasswordInput password,
  }) = _SignupState;
}
