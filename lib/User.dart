import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable(nullable:false)
class User {
  final String name;
  final String email;

  User({this.name, this.email});
  
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}