// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageResponseImpl _$$ChatMessageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageResponseImpl(
      memberId: (json['memberId'] as num).toInt(),
      disconnectedAt: json['disconnectedAt'] == null
          ? null
          : DateTime.parse(json['disconnectedAt'] as String),
      chattingMessage: (json['chattingMessage'] as List<dynamic>)
          .map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatMessageResponseImplToJson(
        _$ChatMessageResponseImpl instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'disconnectedAt': instance.disconnectedAt?.toIso8601String(),
      'chattingMessage': instance.chattingMessage,
      'pageable': instance.pageable,
    };
