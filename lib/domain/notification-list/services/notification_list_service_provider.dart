import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/notification-list/services/notification_list_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_list_service_provider.g.dart';

@riverpod
NotificationListService notificationListService(Ref ref) {
  return NotificationListService();
}
