import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/user/domain/barrel.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    SIMAUser? user,
  }) = _UserState;
}
