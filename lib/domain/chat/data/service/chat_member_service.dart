import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_member_count_response.dart';


class ChatMemberService {
  static final String FETCH_CHAT_MEMBER_COUNT_PATH = "/api/chat/count/";

  static Future<ChatMemberCountResponse> fetchMemberCount(int roomId) async {
    try {
      final response = await ApiClient.get(
          FETCH_CHAT_MEMBER_COUNT_PATH + roomId.toString()
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];

        return ChatMemberCountResponse.fromJson(data);
      } else {
        throw Exception("인원 조회 실패");
      }
    } catch (e) {
      rethrow;
    }
  }
}
