import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_ops_state.dart';

final firebaseOpsControllerProvider = StateNotifierProvider.autoDispose<FirebaseOpsController, FirebaseOpsState>((ref) {
  return FirebaseOpsController(
    const FirebaseOpsState(),
  );
});

class FirebaseOpsController extends StateNotifier<FirebaseOpsState> {
  FirebaseOpsController(
    FirebaseOpsState state,
  ) : super(state);

  void initialize({
    required String? mode,
    required String? oobCode,
    required String? iKey,
  }) {
    state = state.copyWith(
      mode: mode,
      oobCode: oobCode,
      iKey: iKey,
    );
  }
}
