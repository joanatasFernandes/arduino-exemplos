// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationResponse _$AuthorizationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthorizationResponse(
      code: json['code'] as int,
      success: json['success'] as bool,
      message: json['message'] as String,
      jwt: json['jwt'] as String,
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$AuthorizationResponseToJson(
        AuthorizationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'jwt': instance.jwt,
      'timestamp': instance.timestamp,
    };
