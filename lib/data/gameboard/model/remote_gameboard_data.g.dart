// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_gameboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RemoteGameboardResponse _$$_RemoteGameboardResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RemoteGameboardResponse(
      (json['data'] as List<dynamic>).map((e) => e as int).toList(),
      json['message'] as String,
      json['statusCode'] as int,
      json['status'] as String,
    );

Map<String, dynamic> _$$_RemoteGameboardResponseToJson(
        _$_RemoteGameboardResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'status': instance.status,
    };
