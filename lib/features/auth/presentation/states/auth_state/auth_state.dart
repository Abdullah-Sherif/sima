import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial({
    @Default(false) bool isError,
    String? error,
  }) = AuthInitial;

  const factory AuthState.authenticated({
    required bool isEmailVerified,
    @Default(false) bool isError,
    String? error,
  }) = AuthAuthenticated;

  const factory AuthState.unauthenticated({
    @Default(false) bool isError,
    String? error,
  }) = AuthUnauthenticated;

  bool get isLoggedIn => maybeMap(
        authenticated: (value) => true,
        orElse: () => false,
      );

  bool get isEmailVerified => maybeMap(
        authenticated: (value) => value.isEmailVerified,
        orElse: () => false,
      );

  String? get uid => mapOrNull(
        authenticated: (value) => FirebaseAuth.instance.currentUser!.uid,
      );
}
