import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_member_count_response.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_message_response.dart';
import 'package:gachtaxi_app/domain/chat/data/service/chat_member_service.dart';
import 'package:gachtaxi_app/domain/chat/data/service/chat_message_service.dart';
import 'package:gachtaxi_app/domain/chat/data/service/chat_websocket_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_repository.g.dart';

@riverpod
ChatRepository chatRepository(Ref ref) {
  return ChatRepository(
    memberService: ref.watch(chatMemberServiceProvider),
    messageService: ref.watch(chatMessageServiceProvider),
    websocketService: ref.watch(chatWebsocketServiceProvider),
  );
}

class ChatRepository {
  final ChatMemberService _memberService;
  final ChatMessageService _messageService;
  final ChatWebsocketService _websocketService;

  const ChatRepository({
    required ChatMemberService memberService,
    required ChatMessageService messageService,
    required ChatWebsocketService websocketService,
  })  : _memberService = memberService,
        _messageService = messageService,
        _websocketService = websocketService;

  // 멤버
  Future<ChatMemberCountResponse> fetchMemberCount(int roomId) {
    return _memberService.fetchMemberCount(roomId);
  }

  // 메시지
  Future<ChatMessageResponse> fetchMessages({
    required int roomId,
    required int pageNumber,
    String? lastMessageTimeStamp,
  }) {
    return _messageService.fetchMessages(
      roomId,
      pageNumber,
      15,
      lastMessageTimeStamp: lastMessageTimeStamp,
    );
  }

  // 웹소켓
  Future<void> connect({
    required int roomId,
    required Function(dynamic) onMessageReceived,
  }) {
    return _websocketService.connect(
      roomId: roomId,
      onMessageReceived: onMessageReceived,
    );
  }

  void sendMessage(String message) {
    _websocketService.sendMessage(message: message);
  }

  void disconnect() {
    _websocketService.disconnect();
  }
}
