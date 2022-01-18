import 'package:json_annotation/json_annotation.dart';

import '../model/user.dart';

part 'user_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UserResponse {
  final User data;
  final Support support;

  UserResponse({
    required this.data,
    required this.support,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);
  Map<String, dynamic> toJson() => _$SupportToJson(this);
}
