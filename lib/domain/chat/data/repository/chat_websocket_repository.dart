import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/chat/data/service/chat_websocket_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_websocket_repository.g.dart';

@riverpod
ChatWebsocketRepository chatSocketRepository(Ref ref) {
  return ChatWebsocketRepository();
}

class ChatWebsocketRepository {
  const ChatWebsocketRepository();

  Future<void> connect({
    required int roomId,
    required Function(dynamic) onMessageReceived,
  }) async {
    await ChatWebsocketService.connect(
      roomId: roomId,
      onMessageReceived: onMessageReceived,
    );
  }

  void sendMessage(String message) {
    ChatWebsocketService.sendMessage(message: message);
  }

  void disconnect() {
    ChatWebsocketService.disconnect();
  }
}
