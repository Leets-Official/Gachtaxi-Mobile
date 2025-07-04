import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/notification-list/model/unread_notification_model.dart';
import 'package:gachtaxi_app/domain/notification-list/services/unread_notification_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unread_notification_provider.g.dart';

@riverpod
class UnreadNotificationNotifier extends _$UnreadNotificationNotifier {
  @override
  Future<ApiResponse<UnreadNotificationModel>> build() async {
    return await _fetchNoti();
  }

  Future<ApiResponse<UnreadNotificationModel>> _fetchNoti() async {
    final service = ref.read(unreadNotificationServiceProvider);
    return await service.unreadNotificationService();
  }
}
