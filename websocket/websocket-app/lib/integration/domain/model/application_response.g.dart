// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationResponseImpl _$ApplicationResponseImplFromJson(
        Map<String, dynamic> json) =>
    ApplicationResponseImpl(
      success: json['success'] as bool? ?? false,
      unexpectedError: json['unexpectedError'] as bool? ?? false,
      isInternetConnected: json['isInternetConnected'] as bool? ?? false,
      code: json['code'] as int?,
      message: json['message'] as String,
      timestamp: json['timestamp'] as int,
      info: (json['info'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
    );

Map<String, dynamic> _$ApplicationResponseImplToJson(
        ApplicationResponseImpl instance) =>
    <String, dynamic>{
      'unexpectedError': instance.unexpectedError,
      'isInternetConnected': instance.isInternetConnected,
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'timestamp': instance.timestamp,
      'info': instance.info,
    };
