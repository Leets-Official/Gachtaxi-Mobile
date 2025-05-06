import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_message_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_message_repository.g.dart';

@riverpod
ChatMessageRepository chatMessageRepository(Ref ref) => ChatMessageRepository();

class ChatMessageRepository {
  static const String FETCH_CHAT_MESSAGE_PATH = "/api/chat/";

  Future<ChatMessageResponse> fetchMessages(
    int roomId,
    int pageNumber,
    int pageSize, {
    String? lastMessageTimeStamp,
  }) async {
    try {
      final uri = Uri(
        path: '$FETCH_CHAT_MESSAGE_PATH$roomId',
        queryParameters: {
          "pageNumber": pageNumber.toString(),
          "pageSize": pageSize.toString(),
          "lastMessageTimeStamp": lastMessageTimeStamp,
        },
      );
      final response = await ApiClient.get(uri);

      if (response.code == 200) {
        final data = response.data;

        return ChatMessageResponse.fromJson(data);
      } else {
        throw Exception("메시지 로딩 실패");
      }
    } catch (e) {
      rethrow;
    }
  }
}
