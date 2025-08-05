// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_member_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMemberCountResponseImpl _$$ChatMemberCountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMemberCountResponseImpl(
      roomId: (json['roomId'] as num).toInt(),
      totalParticipantCount: (json['totalParticipantCount'] as num).toInt(),
      roomMaster: ChatMemberResponse.fromJson(
          json['roomMaster'] as Map<String, dynamic>),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => ChatMemberResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatMemberCountResponseImplToJson(
        _$ChatMemberCountResponseImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'totalParticipantCount': instance.totalParticipantCount,
      'roomMaster': instance.roomMaster,
      'participants': instance.participants,
    };
