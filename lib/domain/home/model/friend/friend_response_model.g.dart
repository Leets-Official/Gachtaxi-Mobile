// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendResponseImpl _$$FriendResponseImplFromJson(Map<String, dynamic> json) =>
    _$FriendResponseImpl(
      response: (json['response'] as List<dynamic>)
          .map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FriendResponseImplToJson(
        _$FriendResponseImpl instance) =>
    <String, dynamic>{
      'response': instance.response,
      'pageable': instance.pageable,
    };
