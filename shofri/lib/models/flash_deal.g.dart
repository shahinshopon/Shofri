// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_deal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlashDeal _$FlashDealFromJson(Map<String, dynamic> json) {
  return FlashDeal()
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..startDate = json['start_date'] as String
    ..endDate = json['end_date'] as String
    ..status = json['status'] as String
    ..featured = json['featured'] as String
    ..backgroundColor = json['background_color'] as String
    ..textColor = json['text_color'] as String
    ..banner = json['banner'] as String
    ..slug = json['slug'] as String
    ..dealCity = json['deal_city'] as String
    ..dealArea = json['deal_area'] as String
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String;
}

Map<String, dynamic> _$FlashDealToJson(FlashDeal instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'status': instance.status,
      'featured': instance.featured,
      'background_color': instance.backgroundColor,
      'text_color': instance.textColor,
      'banner': instance.banner,
      'slug': instance.slug,
      'deal_city': instance.dealCity,
      'deal_area': instance.dealArea,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
