import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final String name;
  final String id;

  City({
    required this.name,
    required this.id,
  });

  // Map -> Model
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  // Model -> Map
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
