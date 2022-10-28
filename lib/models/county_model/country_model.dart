
import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Countries {

  @JsonKey(defaultValue: "", name: "code")
  String code;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "emoji")
  String emoji;


  Countries({
    required this.name,
    required this.code,
    required this.emoji,

  });

  factory Countries.fromJson(Map<String, dynamic> json) =>
      _$CountriesFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesToJson(this);
}