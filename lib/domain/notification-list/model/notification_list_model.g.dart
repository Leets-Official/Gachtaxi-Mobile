// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationListDataImpl _$$NotificationListDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationListDataImpl(
      response: (json['response'] as List<dynamic>)
          .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationListDataImplToJson(
        _$NotificationListDataImpl instance) =>
    <String, dynamic>{
      'response': instance.response,
      'pageable': instance.pageable,
    };

_$MatchStartNotificationImpl _$$MatchStartNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchStartNotificationImpl(
      notificationId: json['notificationId'] as String,
      receiverId: (json['receiverId'] as num).toInt(),
      content: json['content'] as String,
      payload: MatchPayload.fromJson(json['payload'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      type: json['type'] as String? ?? 'MATCH_START',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MatchStartNotificationImplToJson(
        _$MatchStartNotificationImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'receiverId': instance.receiverId,
      'content': instance.content,
      'payload': instance.payload,
      'createdAt': instance.createdAt,
      'type': instance.type,
      'runtimeType': instance.$type,
    };

_$MatchFinishedNotificationImpl _$$MatchFinishedNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchFinishedNotificationImpl(
      notificationId: json['notificationId'] as String,
      receiverId: (json['receiverId'] as num).toInt(),
      content: json['content'] as String,
      payload: MatchPayload.fromJson(json['payload'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      type: json['type'] as String? ?? 'MATCH_FINISHED',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MatchFinishedNotificationImplToJson(
        _$MatchFinishedNotificationImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'receiverId': instance.receiverId,
      'content': instance.content,
      'payload': instance.payload,
      'createdAt': instance.createdAt,
      'type': instance.type,
      'runtimeType': instance.$type,
    };

_$FriendRequestNotificationImpl _$$FriendRequestNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendRequestNotificationImpl(
      notificationId: json['notificationId'] as String,
      receiverId: (json['receiverId'] as num).toInt(),
      content: json['content'] as String,
      payload: FriendRequestPayload.fromJson(
          json['payload'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      type: json['type'] as String? ?? 'FRIEND_REQUEST',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FriendRequestNotificationImplToJson(
        _$FriendRequestNotificationImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'receiverId': instance.receiverId,
      'content': instance.content,
      'payload': instance.payload,
      'createdAt': instance.createdAt,
      'type': instance.type,
      'runtimeType': instance.$type,
    };

_$MatchInviteNotificationImpl _$$MatchInviteNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchInviteNotificationImpl(
      notificationId: json['notificationId'] as String,
      receiverId: (json['receiverId'] as num).toInt(),
      content: json['content'] as String,
      payload: MatchingRequestPayload.fromJson(
          json['payload'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      type: json['type'] as String? ?? 'MATCH_INVITE',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MatchInviteNotificationImplToJson(
        _$MatchInviteNotificationImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'receiverId': instance.receiverId,
      'content': instance.content,
      'payload': instance.payload,
      'createdAt': instance.createdAt,
      'type': instance.type,
      'runtimeType': instance.$type,
    };

_$MatchPayloadImpl _$$MatchPayloadImplFromJson(Map<String, dynamic> json) =>
    _$MatchPayloadImpl(
      startLocationName: json['startLocationName'] as String,
      endLocationName: json['endLocationName'] as String,
    );

Map<String, dynamic> _$$MatchPayloadImplToJson(_$MatchPayloadImpl instance) =>
    <String, dynamic>{
      'startLocationName': instance.startLocationName,
      'endLocationName': instance.endLocationName,
    };

_$FriendRequestPayloadImpl _$$FriendRequestPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendRequestPayloadImpl(
      status: json['status'] as String,
      profilePicture: json['profilePicture'] as String?,
      senderId: (json['senderId'] as num).toInt(),
    );

Map<String, dynamic> _$$FriendRequestPayloadImplToJson(
        _$FriendRequestPayloadImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'profilePicture': instance.profilePicture,
      'senderId': instance.senderId,
    };

_$MatchingRequestPayloadImpl _$$MatchingRequestPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchingRequestPayloadImpl(
      senderNickname: json['senderNickname'] as String,
      profilePicture: json['profilePicture'] as String?,
      matchingRoomId: (json['matchingRoomId'] as num).toInt(),
    );

Map<String, dynamic> _$$MatchingRequestPayloadImplToJson(
        _$MatchingRequestPayloadImpl instance) =>
    <String, dynamic>{
      'senderNickname': instance.senderNickname,
      'profilePicture': instance.profilePicture,
      'matchingRoomId': instance.matchingRoomId,
    };
