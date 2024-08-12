import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

import 'change_password_state.dart';

final changePasswordControllerProvider = StateNotifierProvider.autoDispose<ChangePasswordController, ChangePasswordState>((ref) {
  return ChangePasswordController(
    const ChangePasswordState(),
    ref.watch(authRepositoryProvider),
  );
});

class ChangePasswordController extends StateNotifier<ChangePasswordState> {
  ChangePasswordController(
    ChangePasswordState state,
    this.authRepository,
  ) : super(state);

  final AuthRepository authRepository;

  void onCurrentPasswordChanged(String value) {
    state = state.copyWith(currentPassword: PasswordInput.pure(value: value));
  }

  void onNewPasswordChanged(String value) {
    state = state.copyWith(newPassword: PasswordInput.pure(value: value));
  }

  Future<void> changePassword() async {
    state = state.copyWith(
      changePasswordStatus: FetchStatus.initial,
      reauthenticationStatus: FetchStatus.loading,
      currentPassword: PasswordInput.dirty(state.currentPassword.value),
      newPassword: PasswordInput.dirty(state.newPassword.value),
    );
    final user = FirebaseAuth.instance.currentUser;

    if (user == null || state.currentPassword.isNotValid || state.newPassword.isNotValid) {
      state = state.copyWith(reauthenticationStatus: FetchStatus.failure);
      return;
    } else {
      final authCredential = EmailAuthProvider.credential(email: user.email!, password: state.currentPassword.value);
      try {
        await user.reauthenticateWithCredential(authCredential);
        state = state.copyWith(reauthenticationStatus: FetchStatus.success);
      } catch (e) {
        state = state.copyWith(reauthenticationStatus: FetchStatus.failure);
      }
    }

    if (state.reauthenticationStatus != FetchStatus.success) {
      state = state.copyWith(changePasswordStatus: FetchStatus.failure);
      return;
    }

    final result = await authRepository.updatePassword(state.newPassword.value, user);

    state = result.fold(
      (failure) => state.copyWith(changePasswordStatus: FetchStatus.failure),
      (success) => state.copyWith(changePasswordStatus: FetchStatus.success),
    );
  }
}
