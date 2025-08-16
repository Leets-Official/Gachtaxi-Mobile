import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/notification-list/model/unread_notification_model.dart';

class UnreadNotificationService {
  Future<ApiResponse<UnreadNotificationModel>>
      unreadNotificationService() async {
    final path = '/api/notifications/unread';

    final uri = Uri.parse(path);

    final response = await ApiClient.get(uri);

    if (response.code == 200 && response.data is Map<String, dynamic>) {
      return ApiResponse(
          code: response.code, message: response.message, data: response.data);
    } else {
      throw Exception("읽지않은 알림 받아오기 실패");
    }
  }
}
