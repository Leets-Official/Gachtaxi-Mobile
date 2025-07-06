import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';

part 'notification_list_model.freezed.dart';
part 'notification_list_model.g.dart';

@freezed
class NotificationListData with _$NotificationListData {
  const factory NotificationListData({
    required List<NotificationModel> response,
    required Pageable pageable,
  }) = _NotificationListData;

  factory NotificationListData.fromJson(Map<String, dynamic> json) =>
      _$NotificationListDataFromJson(json);
}

@freezed
sealed class NotificationModel with _$NotificationModel {
  const factory NotificationModel.matchStart({
    required String notificationId,
    required int receiverId,
    required String content,
    required MatchPayload payload,
    required String createdAt,
    @Default('MATCH_START') String type,
  }) = MatchStartNotification;

  const factory NotificationModel.matchFinished({
    required String notificationId,
    required int receiverId,
    required String content,
    required MatchPayload payload,
    required String createdAt,
    @Default('MATCH_FINISHED') String type,
  }) = MatchFinishedNotification;

  const factory NotificationModel.friendRequest({
    required String notificationId,
    required int receiverId,
    required String content,
    required FriendRequestPayload payload,
    required String createdAt,
    @Default('FRIEND_REQUEST') String type,
  }) = FriendRequestNotification;

  const factory NotificationModel.matchInvite({
    required String notificationId,
    required int receiverId,
    required String content,
    required MatchingRequestPayload payload,
    required String createdAt,
    @Default('MATCH_INVITE') String type,
  }) = MatchInviteNotification;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

@freezed
class MatchPayload with _$MatchPayload {
  const factory MatchPayload({
    required String startLocationName,
    required String endLocationName,
  }) = _MatchPayload;

  factory MatchPayload.fromJson(Map<String, dynamic> json) =>
      _$MatchPayloadFromJson(json);
}

@freezed
class FriendRequestPayload with _$FriendRequestPayload {
  const factory FriendRequestPayload({
    required String status,
    required int senderId,
  }) = _FriendRequestPayload;

  factory FriendRequestPayload.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestPayloadFromJson(json);
}

@freezed
class MatchingRequestPayload with _$MatchingRequestPayload {
  const factory MatchingRequestPayload({
    required String senderNickname,
    required int matchingRoomId,
  }) = _MatchingRequestPayload;

  factory MatchingRequestPayload.fromJson(Map<String, dynamic> json) =>
      _$MatchingRequestPayloadFromJson(json);
}
