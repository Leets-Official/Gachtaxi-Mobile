import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';

class NotificationListService {
  final path = '/api/notifications';

  Future<ApiResponse<NotificationListData>> fetchNotificationService(
    int pageNum,
    int pageSize,
  ) async {
    final uri = Uri.parse(path).replace(queryParameters: {
      "pageNum": pageNum.toString(),
      "pageSize": pageSize.toString(),
    });

    final response = await ApiClient.get(uri);

    if (response.code == 200 && response.data is Map<String, dynamic>) {
      final data =
          NotificationListData.fromJson(response.data as Map<String, dynamic>);
      return ApiResponse(
        code: 200,
        message: "성공",
        data: data,
      );
    } else {
      throw Exception("알림 리스트 조회 실패");
    }
  }

  Future<ApiResponse> deleteNotificationService(String notificationId) async {
    final uri = Uri.parse('$path/$notificationId');

    final response = await ApiClient.delete(uri);

    if (response.code == 200) {
      return ApiResponse(
          code: response.code, message: response.message, data: {});
    } else {
      throw Exception("알림 개별 삭제 실패: ${response.message}");
    }
  }
}
