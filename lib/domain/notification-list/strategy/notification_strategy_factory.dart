import 'package:gachtaxi_app/common/enums/match_type.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';
import 'package:gachtaxi_app/domain/notification-list/strategy/friend_request_notification_strategy.dart';
import 'package:gachtaxi_app/domain/notification-list/strategy/match_base_notification_strategy.dart';
import 'package:gachtaxi_app/domain/notification-list/strategy/match_invite_notification_strategy.dart';
import 'package:gachtaxi_app/domain/notification-list/strategy/notification_list_ui_strategy.dart';

class NotificationUiStrategyFactory {
  static NotificationUiStrategy getStrategy(NotificationModel model) {
    return model.map(
      matchStart: (_) =>
          MatchBaseNotificationStrategy(matchType: MatchType.start),
      matchFinished: (_) =>
          MatchBaseNotificationStrategy(matchType: MatchType.finish),
      friendRequest: (_) => FriendRequestNotificationStrategy(),
      matchInvite: (_) => MatchInviteNotificationStrategy(),
    );
  }
}
