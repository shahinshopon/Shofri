// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as String
    ..userType = json['user_type'] as String
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..emailVerifiedAt = json['email_verified_at'] as String
    ..password = json['password'] as String
    ..rememberToken = json['remember_token'] as String
    ..avatar = json['avatar'] as String
    ..avatarOriginal = json['avatar_original'] as String
    ..address = json['address'] as String
    ..country = json['country'] as String
    ..city = json['city'] as String
    ..postalCode = json['postal_code'] as String
    ..phone = json['phone'] as String
    ..balance = json['balance'] as String
    ..referralCode = json['referral_code'] as String
    ..remainingUploads = json['remaining_uploads'] as String
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'user_type': instance.userType,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'password': instance.password,
      'remember_token': instance.rememberToken,
      'avatar': instance.avatar,
      'avatar_original': instance.avatarOriginal,
      'address': instance.address,
      'country': instance.country,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'phone': instance.phone,
      'balance': instance.balance,
      'referral_code': instance.referralCode,
      'remaining_uploads': instance.remainingUploads,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
