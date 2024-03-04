import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/features/barrel.dart';

import 'auth_state.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  return AuthController(const AuthInitial(), authRepository, userRepository);
});

class AuthController extends StateNotifier<AuthState> {
  AuthController(
    AuthState state,
    this._authRepository,
    this._userRepository,
  ) : super(state) {
    _authRepository.userAuthStateChanges.listen((user) async {
      if (user == null) {
        this.state = const AuthUnauthenticated();
      } else {
        await _userRepository.getUser(uid: _authRepository.userID!).firstWhere((element) => element != null);

        this.state = AuthAuthenticated(isEmailVerified: user.emailVerified);
      }
    });
  }

  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  AuthState get noError => state.copyWith(
        isError: false,
      );

  void signout() async {
    state = noError;

    final result = await _authRepository.signout();

    result.fold(
      (failure) => state = state.copyWith(error: failure.message, isError: true),
      (success) => state = const AuthUnauthenticated(),
    );
  }

  void setEmailVerified({
    required SIMAUser? user,
  }) {
    if (user == null) return;

    _userRepository.updateUser(
      user: user.copyWith(emailVerified: true),
    );

    state = state.maybeMap(
      authenticated: (value) => value.copyWith(isEmailVerified: true),
      orElse: () => state,
    );
  }
}
