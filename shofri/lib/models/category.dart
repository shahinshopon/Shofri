import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "commision_rate")
  String commisionRate;

  @JsonKey(name: "banner")
  String banner;

  @JsonKey(name: "icon")
  String icon;

  @JsonKey(name: "featured")
  String featured;

  @JsonKey(name: "top")
  String top;

  @JsonKey(name: "slug")
  String slug;

  @JsonKey(name: "digital")
  String digital;

  @JsonKey(name: "meta_title")
  String metaTitle;

  @JsonKey(name: "meta_description")
  String metaDescription;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  @JsonKey(name: "mobile_icon_category")
  String mobileIconCategory;

  Category();

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
