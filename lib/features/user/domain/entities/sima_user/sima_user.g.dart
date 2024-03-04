// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sima_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SIMAUserImpl _$$SIMAUserImplFromJson(Map<String, dynamic> json) =>
    _$SIMAUserImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      emailVerified: json['emailVerified'] as bool? ?? null,
    );

Map<String, dynamic> _$$SIMAUserImplToJson(_$SIMAUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
    };
