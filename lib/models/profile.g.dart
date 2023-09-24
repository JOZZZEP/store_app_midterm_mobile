// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile()
  ..address = json['address'] as Map<String, dynamic>
  ..id = json['id'] as num
  ..email = json['email'] as String
  ..username = json['username'] as String
  ..password = json['password'] as String
  ..name = json['name'] as Map<String, dynamic>
  ..phone = json['phone'] as String;

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
    };
