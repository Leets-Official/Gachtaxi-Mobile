import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_message_response.dart';

class ChatMessageService {
  static final String FETCH_CHAT_MESSAGE_PATH = "/api/chat/";

  static const int pageSize = 20;

  static Future<ChatMessageResponse> fetchMessages(int roomId, int pageNumber,
      {String? lastMessageTimeStamp}) async {
    try {
      final response = await ApiClient.get(
          FETCH_CHAT_MESSAGE_PATH + roomId.toString(),
          params: {
            "pageNumber": pageNumber,
            "pageSize": pageSize,
            "lastMessageTimeStamp": lastMessageTimeStamp,
          });

      if (response.statusCode == 200) {
        final data = response.data['data'];

        return ChatMessageResponse.fromJson(data);
      } else {
        throw Exception("메시지 로딩 실패");
      }
    } catch (e) {
      rethrow;
    }
  }
}
