import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_member_count_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_member_service.g.dart';

@riverpod
ChatMemberService chatMemberService(Ref ref) => ChatMemberService();

class ChatMemberService {
  final String FETCH_CHAT_MEMBER_COUNT_PATH = "/api/chat/count/";

  Future<ChatMemberCountResponse> fetchMemberCount(int roomId) async {
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