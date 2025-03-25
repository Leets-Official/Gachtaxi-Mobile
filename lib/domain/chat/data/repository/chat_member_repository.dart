import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_member_count_response.dart';
import 'package:gachtaxi_app/domain/chat/data/service/chat_member_service.dart';

part 'chat_member_repository.g.dart';

@riverpod
ChatMemberRepository chatMemberRepository(Ref ref) {
  return const ChatMemberRepository();
}

class ChatMemberRepository {
  const ChatMemberRepository();

  Future<ChatMemberCountResponse> fetchMemberCount(int roomId) async {
    return await ChatMemberService.fetchMemberCount(roomId);
  }
}


