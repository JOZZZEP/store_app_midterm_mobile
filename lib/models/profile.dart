import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile();

  late Map<String,dynamic> address;
  late num id;
  late String email;
  late String username;
  late String password;
  late Map<String,dynamic> name;
  late String phone;
  
  factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
