import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/notification-list/services/unread_notification_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unread_notification_service_provider.g.dart';

@riverpod
UnreadNotificationService unreadNotificationService(Ref ref) {
  return UnreadNotificationService();
}
