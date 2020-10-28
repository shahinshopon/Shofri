import 'package:json_annotation/json_annotation.dart';

part 'slider.g.dart';

@JsonSerializable()
class SliderModel {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "photo")
  String photo;

  @JsonKey(name: "published")
  String published;

  @JsonKey(name: "link")
  String link;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  SliderModel();

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}
