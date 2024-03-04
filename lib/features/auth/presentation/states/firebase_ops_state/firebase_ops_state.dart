import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_ops_state.freezed.dart';

@freezed
class FirebaseOpsState with _$FirebaseOpsState {
  const factory FirebaseOpsState({
    String? mode,
    String? oobCode,
    String? iKey,
  }) = _FirebaseOpsState;
}
