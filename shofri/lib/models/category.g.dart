// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..commisionRate = json['commision_rate'] as String
    ..banner = json['banner'] as String
    ..icon = json['icon'] as String
    ..featured = json['featured'] as String
    ..top = json['top'] as String
    ..slug = json['slug'] as String
    ..digital = json['digital'] as String
    ..metaTitle = json['meta_title'] as String
    ..metaDescription = json['meta_description'] as String
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String
    ..mobileIconCategory = json['mobile_icon_category'] as String;
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'commision_rate': instance.commisionRate,
      'banner': instance.banner,
      'icon': instance.icon,
      'featured': instance.featured,
      'top': instance.top,
      'slug': instance.slug,
      'digital': instance.digital,
      'meta_title': instance.metaTitle,
      'meta_description': instance.metaDescription,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'mobile_icon_category': instance.mobileIconCategory,
    };
