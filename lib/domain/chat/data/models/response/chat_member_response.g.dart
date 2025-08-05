// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMemberResponseImpl _$$ChatMemberResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMemberResponseImpl(
      memberId: (json['memberId'] as num).toInt(),
      nickName: json['nickName'] as String,
      profilePicture: json['profilePicture'] as String,
    );

Map<String, dynamic> _$$ChatMemberResponseImplToJson(
        _$ChatMemberResponseImpl instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'nickName': instance.nickName,
      'profilePicture': instance.profilePicture,
    };
