import 'package:json_annotation/json_annotation.dart';
part 'origin.g.dart';

@JsonSerializable()
class Origin {
  String name;
  String url;

  Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}
