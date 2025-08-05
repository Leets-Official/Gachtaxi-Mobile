// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blacklist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlacklistImpl _$$BlacklistImplFromJson(Map<String, dynamic> json) =>
    _$BlacklistImpl(
      receiverId: (json['receiverId'] as num).toInt(),
      receiverNickname: json['receiverNickname'] as String,
      receiverProfilePicture: json['receiverProfilePicture'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$$BlacklistImplToJson(_$BlacklistImpl instance) =>
    <String, dynamic>{
      'receiverId': instance.receiverId,
      'receiverNickname': instance.receiverNickname,
      'receiverProfilePicture': instance.receiverProfilePicture,
      'gender': _$GenderEnumMap[instance.gender]!,
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
};
