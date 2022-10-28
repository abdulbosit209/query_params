// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Countries _$CountriesFromJson(Map<String, dynamic> json) => Countries(
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      emoji: json['emoji'] as String? ?? '',
    );

Map<String, dynamic> _$CountriesToJson(Countries instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'emoji': instance.emoji,
    };
