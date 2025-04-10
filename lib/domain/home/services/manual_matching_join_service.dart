import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';

class ManualMatchingJoinService {
  static Future<ApiResponse> joinManualMatchingRoom(int roomId) async {
    const String joinMatchingRoomPath = '/api/matching/manual/join';
    final uri = Uri.parse(joinMatchingRoomPath);

    final body = {
      "roomId": roomId,
    };

    try {
      final response = await ApiClient.post(uri, body: body);
      return response;
    } catch (e) {
      throw Exception("매칭방 참여 실패");
    }
  }
}
