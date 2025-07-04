import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';

class NotificationListService {
  Future<ApiResponse<NotificationListData>> fetchNotificationService(
    int pageNum,
    int pageSize,
  ) async {
    final path = '/api/notifications';

    final uri = Uri.parse(path).replace(queryParameters: {
      "pageNum": pageNum.toString(),
      "pageSize": pageSize.toString(),
    });

    final response = await ApiClient.get(uri);

    if (response.code == 200 && response.data is Map<String, dynamic>) {
      return ApiResponse.fromJson(
        Map<String, dynamic>.from(response.data),
        (json) => NotificationListData.fromJson(json as Map<String, dynamic>),
      );
    } else {
      throw Exception("알림 리스트 조회 실패");
    }
  }
}
