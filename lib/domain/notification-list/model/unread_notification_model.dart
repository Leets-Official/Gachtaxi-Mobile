import 'package:freezed_annotation/freezed_annotation.dart';

part 'unread_notification_model.freezed.dart';
part 'unread_notification_model.g.dart';

@freezed
abstract class UnreadNotificationModel with _$UnreadNotificationModel {
  const factory UnreadNotificationModel({
    required int unreadCount,
    required bool hasUnreadNotifications,
  }) = _UnreadNotificationModel;

  factory UnreadNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$UnreadNotificationModelFromJson(json);
}
