// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageModelImpl _$$ChatMessageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageModelImpl(
      messageId: json['messageId'] as String?,
      roomId: (json['roomId'] as num?)?.toInt(),
      senderId: (json['senderId'] as num).toInt(),
      senderName: json['senderName'] as String,
      message: json['message'] as String?,
      profilePicture: json['profilePicture'] as String?,
      unreadCount: (json['unreadCount'] as num?)?.toInt(),
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      messageType: $enumDecode(_$MessageTypeEnumMap, json['messageType']),
      startMessageId: json['startMessageId'] as String?,
      endMessageId: json['endMessageId'] as String?,
    );

Map<String, dynamic> _$$ChatMessageModelImplToJson(
        _$ChatMessageModelImpl instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'roomId': instance.roomId,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'message': instance.message,
      'profilePicture': instance.profilePicture,
      'unreadCount': instance.unreadCount,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'messageType': _$MessageTypeEnumMap[instance.messageType]!,
      'startMessageId': instance.startMessageId,
      'endMessageId': instance.endMessageId,
    };

const _$MessageTypeEnumMap = {
  MessageType.READ: 'READ',
  MessageType.ENTER: 'ENTER',
  MessageType.MESSAGE: 'MESSAGE',
  MessageType.EXIT: 'EXIT',
};
