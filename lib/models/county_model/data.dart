
import 'package:json_annotation/json_annotation.dart';
import 'package:query_params/models/county_model/country_model.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {

  @JsonKey(defaultValue: "", name: "data")
  String data;

  @JsonKey(defaultValue: [], name: "countries")
  List<Countries> countries;

  Data({
    required this.data,
    required this.countries
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
