import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/barrel.dart';
import '../../../domain/barrel.dart';
import 'user_state.dart';

final userConrollerProvider = StateNotifierProvider.autoDispose<UserConroller, UserState>((ref) {
  return UserConroller(
    const UserState(),
    ref.watch(userRepositoryProvider),
  );
});

class UserConroller extends StateNotifier<UserState> {
  UserConroller(
    UserState state,
    this._userRepository,
  ) : super(state) {
    _userRepository.onUserChanged.listen((user) {
      if (user != null) {
        setUser(user);
      }
    });
  }

  final UserRepository _userRepository;

  void setUser(SIMAUser user) {
    state = UserState(user: user);
  }

  void deleteUser() async {
    final result = await _userRepository.deleteUser(uid: state.user!.uid);

    result.fold(
      (success) => state = const UserState(),
      (failure) => state = state,
    );
  }

  void unauthenticated() {
    _userRepository.onUnauthenticated();
    state = const UserState();
  }
}
