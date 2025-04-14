import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_member_count_response.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_message_response.dart';
import 'package:gachtaxi_app/domain/chat/data/repository/chat_member_repository.dart';
import 'package:gachtaxi_app/domain/chat/data/repository/chat_message_repository.dart';
import 'package:gachtaxi_app/domain/chat/data/repository/chat_websocket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_service.g.dart';

@riverpod
ChatService chatService(Ref ref) {
  return ChatService(
    memberRepository: ref.watch(chatMemberRepositoryProvider),
    messageRepository: ref.watch(chatMessageRepositoryProvider),
    websocketRepository: ref.watch(chatWebsocketRepositoryProvider),
  );
}

class ChatService {
  final ChatMemberRepository _memberRepository;
  final ChatMessageRepository _messageRepository;
  final ChatWebsocketRepository _websocketRepository;

  final int pageSize = 15;

  const ChatService({
    required ChatMemberRepository memberRepository,
    required ChatMessageRepository messageRepository,
    required ChatWebsocketRepository websocketRepository,
  })  : _memberRepository = memberRepository,
        _messageRepository = messageRepository,
        _websocketRepository = websocketRepository;

  // 멤버
  Future<ChatMemberCountResponse> fetchMemberCount(int roomId) {
    return _memberRepository.fetchMemberCount(roomId);
  }

  // 메시지
  Future<ChatMessageResponse> fetchMessages({
    required int roomId,
    required int pageNumber,
    String? lastMessageTimeStamp,
  }) {
    return _messageRepository.fetchMessages(
      roomId,
      pageNumber,
      pageSize,
      lastMessageTimeStamp: lastMessageTimeStamp,
    );
  }

  // 웹소켓
  Future<void> connect({
    required int roomId,
    required Function(dynamic) onMessageReceived,
  }) async {
    return await _websocketRepository.connect(
      roomId: roomId,
      onMessageReceived: onMessageReceived,
    );
  }

  void sendMessage(String message) {
    _websocketRepository.sendMessage(message: message);
  }

  void disconnect() {
    _websocketRepository.disconnect();
  }
}
