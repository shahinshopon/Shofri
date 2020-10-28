import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "user_type")
  String userType;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "email_verified_at")
  String emailVerifiedAt;

  @JsonKey(name: "password")
  String password;

  @JsonKey(name: "remember_token")
  String rememberToken;

  @JsonKey(name: "avatar")
  String avatar;

  @JsonKey(name: "avatar_original")
  String avatarOriginal;

  @JsonKey(name: "address")
  String address;

  @JsonKey(name: "country")
  String country;

  @JsonKey(name: "city")
  String city;

  @JsonKey(name: "postal_code")
  String postalCode;

  @JsonKey(name: "phone")
  String phone;

  @JsonKey(name: "balance")
  String balance;

  @JsonKey(name: "referral_code")
  String referralCode;

  @JsonKey(name: "remaining_uploads")
  String remainingUploads;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
