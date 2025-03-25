import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_message_response.dart';
import 'package:gachtaxi_app/domain/chat/data/service/chat_message_service.dart';

part 'chat_message_repository.g.dart';

@riverpod
ChatMessageRepository chatMessageRepository(Ref ref) {
  return ChatMessageRepository();
}

class ChatMessageRepository {
  const ChatMessageRepository();

  Future<ChatMessageResponse> fetchMessages(
      int roomId,
      int pageNumber, {
        String? lastMessageTimeStamp,
      }) async {
    return await ChatMessageService.fetchMessages(
      roomId,
      pageNumber,
      lastMessageTimeStamp: lastMessageTimeStamp,
    );
  }
}
