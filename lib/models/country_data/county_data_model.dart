
import 'package:json_annotation/json_annotation.dart';
import 'package:query_params/models/country_data/languages.dart';

part 'county_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CountryDataModel {

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "native")
  String native;

  @JsonKey(defaultValue: "", name: "capital")
  String capital;

  @JsonKey(defaultValue: "", name: "emoji")
  String emoji;

  @JsonKey(defaultValue: "", name: "currency")
  String currency;

  @JsonKey(defaultValue: [], name: "languages")
  List<Languages> languages;

  CountryDataModel({
    required this.name,
    required this.currency,
    required this.capital,
    required this.emoji,
    required this.languages,
    required this.native,
  });

  factory CountryDataModel.fromJson(Map<String, dynamic> json) =>
      _$CountryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDataModelToJson(this);
}