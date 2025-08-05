// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_matching_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchingRoomImpl _$$MatchingRoomImplFromJson(Map<String, dynamic> json) =>
    _$MatchingRoomImpl(
      roomId: (json['roomId'] as num).toInt(),
      chattingRoomId: (json['chattingRoomId'] as num).toInt(),
      nickname: json['nickname'] as String?,
      profilePicture: json['profilePicture'] as String?,
      gender: json['gender'] as String?,
      description: json['description'] as String,
      departure: json['departure'] as String,
      destination: json['destination'] as String,
      departureTime: json['departureTime'] as String,
      departureDate: json['departureDate'] as String?,
      maxCapacity: (json['maxCapacity'] as num).toInt(),
      currentMembers: (json['currentMembers'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MatchingRoomImplToJson(_$MatchingRoomImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'chattingRoomId': instance.chattingRoomId,
      'nickname': instance.nickname,
      'profilePicture': instance.profilePicture,
      'gender': instance.gender,
      'description': instance.description,
      'departure': instance.departure,
      'destination': instance.destination,
      'departureTime': instance.departureTime,
      'departureDate': instance.departureDate,
      'maxCapacity': instance.maxCapacity,
      'currentMembers': instance.currentMembers,
      'tags': instance.tags,
    };
