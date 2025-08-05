// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendImpl _$$FriendImplFromJson(Map<String, dynamic> json) => _$FriendImpl(
      friendsId: (json['friendsId'] as num).toInt(),
      friendsNickName: json['friendsNickName'] as String,
      friendsProfileUrl: json['friendsProfileUrl'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      chatRoomId: (json['chatRoomId'] as num).toInt(),
    );

Map<String, dynamic> _$$FriendImplToJson(_$FriendImpl instance) =>
    <String, dynamic>{
      'friendsId': instance.friendsId,
      'friendsNickName': instance.friendsNickName,
      'friendsProfileUrl': instance.friendsProfileUrl,
      'gender': _$GenderEnumMap[instance.gender]!,
      'chatRoomId': instance.chatRoomId,
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
};
