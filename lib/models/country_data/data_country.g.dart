// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCountry _$DataCountryFromJson(Map<String, dynamic> json) => DataCountry(
      data: json['data'] as String? ?? '',
      country:
          CountryDataModel.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataCountryToJson(DataCountry instance) =>
    <String, dynamic>{
      'data': instance.data,
      'country': instance.country,
    };
