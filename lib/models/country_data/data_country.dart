
import 'package:json_annotation/json_annotation.dart';
import 'package:query_params/models/country_data/county_data_model.dart';

part 'data_country.g.dart';

@JsonSerializable()
class DataCountry {

  @JsonKey(defaultValue: "", name: "data")
  String data;

  @JsonKey(name: "country")
  CountryDataModel country;

  DataCountry({
    required this.data,
    required this.country
  });

  factory DataCountry.fromJson(Map<String, dynamic> json) =>
      _$DataCountryFromJson(json);

  Map<String, dynamic> toJson() => _$DataCountryToJson(this);
}
