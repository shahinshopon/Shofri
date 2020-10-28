import 'package:json_annotation/json_annotation.dart';

part 'flash_deal.g.dart';

@JsonSerializable()
class FlashDeal {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "start_date")
  String startDate;

  @JsonKey(name: "end_date")
  String endDate;

  @JsonKey(name: "status")
  String status;

  @JsonKey(name: "featured")
  String featured;

  @JsonKey(name: "background_color")
  String backgroundColor;

  @JsonKey(name: "text_color")
  String textColor;

  @JsonKey(name: "banner")
  String banner;

  @JsonKey(name: "slug")
  String slug;

  @JsonKey(name: "deal_city")
  String dealCity;

  @JsonKey(name: "deal_area")
  String dealArea;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  FlashDeal();

  factory FlashDeal.fromJson(Map<String, dynamic> json) =>
      _$FlashDealFromJson(json);

  Map<String, dynamic> toJson() => _$FlashDealToJson(this);
}
