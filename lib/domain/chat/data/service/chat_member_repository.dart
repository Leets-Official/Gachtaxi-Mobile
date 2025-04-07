import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_member_count_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_member_repository.g.dart';

@riverpod
ChatMemberRepository chatMemberRepository(Ref ref) => ChatMemberRepository();

class ChatMemberRepository {
  static const String FETCH_CHAT_MEMBER_COUNT_PATH = "/api/chat/count/";

  Future<ChatMemberCountResponse> fetchMemberCount(int roomId) async {
    try {
      final response = await ApiClient.get(
          Uri.parse('$FETCH_CHAT_MEMBER_COUNT_PATH$roomId')
      );

      if (response.code == 200) {
        final data = response.data;

        return ChatMemberCountResponse.fromJson(data);
      } else {
        throw Exception("인원 조회 실패");
      }
    } catch (e) {
      rethrow;
    }
  }
}