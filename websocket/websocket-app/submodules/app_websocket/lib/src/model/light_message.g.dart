// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LightMessage _$LightMessageFromJson(Map<String, dynamic> json) => LightMessage(
      status: json['status'] as String,
      lightId: json['lightId'] as String,
      lightName: json['lightName'] as String,
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$LightMessageToJson(LightMessage instance) =>
    <String, dynamic>{
      'status': instance.status,
      'lightId': instance.lightId,
      'lightName': instance.lightName,
      'isAvailable': instance.isAvailable,
    };
