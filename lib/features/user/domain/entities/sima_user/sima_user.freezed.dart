// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sima_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SIMAUser _$SIMAUserFromJson(Map<String, dynamic> json) {
  return _SIMAUser.fromJson(json);
}

/// @nodoc
mixin _$SIMAUser {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool? get emailVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SIMAUserCopyWith<SIMAUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SIMAUserCopyWith<$Res> {
  factory $SIMAUserCopyWith(SIMAUser value, $Res Function(SIMAUser) then) =
      _$SIMAUserCopyWithImpl<$Res, SIMAUser>;
  @useResult
  $Res call({String uid, String email, bool? emailVerified});
}

/// @nodoc
class _$SIMAUserCopyWithImpl<$Res, $Val extends SIMAUser>
    implements $SIMAUserCopyWith<$Res> {
  _$SIMAUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? emailVerified = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SIMAUserImplCopyWith<$Res>
    implements $SIMAUserCopyWith<$Res> {
  factory _$$SIMAUserImplCopyWith(
          _$SIMAUserImpl value, $Res Function(_$SIMAUserImpl) then) =
      __$$SIMAUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String email, bool? emailVerified});
}

/// @nodoc
class __$$SIMAUserImplCopyWithImpl<$Res>
    extends _$SIMAUserCopyWithImpl<$Res, _$SIMAUserImpl>
    implements _$$SIMAUserImplCopyWith<$Res> {
  __$$SIMAUserImplCopyWithImpl(
      _$SIMAUserImpl _value, $Res Function(_$SIMAUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? emailVerified = freezed,
  }) {
    return _then(_$SIMAUserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SIMAUserImpl implements _SIMAUser {
  const _$SIMAUserImpl(
      {required this.uid, required this.email, this.emailVerified = null});

  factory _$SIMAUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$SIMAUserImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  @JsonKey()
  final bool? emailVerified;

  @override
  String toString() {
    return 'SIMAUser(uid: $uid, email: $email, emailVerified: $emailVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SIMAUserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email, emailVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SIMAUserImplCopyWith<_$SIMAUserImpl> get copyWith =>
      __$$SIMAUserImplCopyWithImpl<_$SIMAUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SIMAUserImplToJson(
      this,
    );
  }
}

abstract class _SIMAUser implements SIMAUser {
  const factory _SIMAUser(
      {required final String uid,
      required final String email,
      final bool? emailVerified}) = _$SIMAUserImpl;

  factory _SIMAUser.fromJson(Map<String, dynamic> json) =
      _$SIMAUserImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  bool? get emailVerified;
  @override
  @JsonKey(ignore: true)
  _$$SIMAUserImplCopyWith<_$SIMAUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
