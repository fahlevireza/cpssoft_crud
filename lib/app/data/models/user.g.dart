// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      address: json['address'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      city: json['city'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'city': instance.city,
      'id': instance.id,
    };
