// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnreadNotificationModelImpl _$$UnreadNotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnreadNotificationModelImpl(
      unreadCount: (json['unreadCount'] as num).toInt(),
      hasUnreadNotifications: json['hasUnreadNotifications'] as bool,
    );

Map<String, dynamic> _$$UnreadNotificationModelImplToJson(
        _$UnreadNotificationModelImpl instance) =>
    <String, dynamic>{
      'unreadCount': instance.unreadCount,
      'hasUnreadNotifications': instance.hasUnreadNotifications,
    };
