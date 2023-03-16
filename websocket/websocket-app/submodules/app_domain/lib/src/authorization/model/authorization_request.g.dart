// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationRequest _$AuthorizationRequestFromJson(
        Map<String, dynamic> json) =>
    AuthorizationRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthorizationRequestToJson(
        AuthorizationRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
