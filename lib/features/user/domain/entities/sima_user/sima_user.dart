import 'package:freezed_annotation/freezed_annotation.dart';

part 'sima_user.freezed.dart';
part 'sima_user.g.dart';

@freezed
class SIMAUser with _$SIMAUser {
  const factory SIMAUser({
    required String uid,
    required String email,
    @Default(null) bool? emailVerified,
  }) = _SIMAUser;

  factory SIMAUser.fromJson(Map<String, dynamic> json) => _$SIMAUserFromJson(json);
}
