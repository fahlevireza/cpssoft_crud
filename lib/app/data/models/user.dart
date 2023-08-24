import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final String city;
  final String id;

  User({
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.city,
    required this.id,
  });

  // Map -> Model
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Model -> Map
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
