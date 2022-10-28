// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'county_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDataModel _$CountryDataModelFromJson(Map<String, dynamic> json) =>
    CountryDataModel(
      name: json['name'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      capital: json['capital'] as String? ?? '',
      emoji: json['emoji'] as String? ?? '',
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => Languages.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      native: json['native'] as String? ?? '',
    );

Map<String, dynamic> _$CountryDataModelToJson(CountryDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'native': instance.native,
      'capital': instance.capital,
      'emoji': instance.emoji,
      'currency': instance.currency,
      'languages': instance.languages.map((e) => e.toJson()).toList(),
    };
