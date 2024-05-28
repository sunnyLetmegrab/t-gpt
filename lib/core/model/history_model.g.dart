// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryModelImpl _$$HistoryModelImplFromJson(Map<String, dynamic> json) =>
    _$HistoryModelImpl(
      message: json['message'] as String,
      roomId: (json['roomId'] as num).toInt(),
      lastMessageTime: DateTime.parse(json['lastMessageTime'] as String),
    );

Map<String, dynamic> _$$HistoryModelImplToJson(_$HistoryModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'roomId': instance.roomId,
      'lastMessageTime': instance.lastMessageTime.toIso8601String(),
    };
