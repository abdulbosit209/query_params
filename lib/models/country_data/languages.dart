import 'package:json_annotation/json_annotation.dart';


part 'languages.g.dart';

@JsonSerializable(explicitToJson: true)
class Languages {

  @JsonKey(defaultValue: "", name: "code")
  String code;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  Languages({
    required this.code,
    required this.name
  });

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}