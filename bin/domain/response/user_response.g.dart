// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      data: User.fromJson(json['data'] as Map<String, dynamic>),
      support: Support.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'support': instance.support.toJson(),
    };

Support _$SupportFromJson(Map<String, dynamic> json) => Support(
      url: json['url'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$SupportToJson(Support instance) => <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
