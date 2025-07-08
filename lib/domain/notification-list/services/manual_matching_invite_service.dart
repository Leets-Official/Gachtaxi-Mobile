import 'package:dio/dio.dart';
import 'package:gachtaxi_app/common/enums/status_type.dart';
import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';

class ManualMatchingInviteService {
  Future<ApiResponse> accept(int matchingRoomId, String notificationId) async {
    const String path = '/api/matching/manual/invite/reply';
    final uri = Uri.parse(path);

    try {
      final res = await ApiClient.post(uri, body: {
        "matchingRoomId": matchingRoomId,
        "notificationId": notificationId,
        "status": StatusType.accepted.value,
      });

      return res;
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? '매칭 초대 수락 실패';
      throw Exception(message);
    } catch (e) {
      throw Exception('매칭 초대 수락 중 알 수 없는 오류가 발생했습니다.');
    }
  }
}
