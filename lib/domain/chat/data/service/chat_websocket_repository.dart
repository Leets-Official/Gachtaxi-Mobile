import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/util/logger.dart';
import 'package:gachtaxi_app/common/util/token_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

part 'chat_websocket_repository.g.dart';

@riverpod
ChatWebsocketRepository chatWebsocketRepository(Ref ref) => ChatWebsocketRepository();

class ChatWebsocketRepository {

  StompClient? _stompClient;

  // 웹소켓 연결 확인 메서드
  bool get isConnected => _stompClient?.connected ?? false;

  // WebSocket 연결
  Future<void> connect({
    required int roomId,
    required Function(dynamic) onMessageReceived,
  }) async {
    final token = await TokenStorage.loadAccessToken();

    if (token == null || token.isEmpty) {
      logger.e("❌ [WebSocket] 연결 실패: 토큰이 없습니다.");
      return;
    }

    final Map<String, String> finalHeaders = {
      'Authorization': 'Bearer $token',
    };

    final completer = Completer<void>();

    _stompClient = StompClient(
      config: StompConfig(
        url: dotenv.env['WEBSOCKET_URL'] ?? 'ws://localhost:8080/ws',
        //ws://10.0.2.2:8080/ws  | 안드로이드는 localhost를 에뮬레이터로 알기 때문에 이렇게 해줘야함
        stompConnectHeaders: finalHeaders,

        onConnect: (StompFrame frame) {
          logger.i("✅ [WebSocket] STOMP 연결 성공");

          // 구독 (특정 채팅방의 메시지 수신)
          _stompClient?.subscribe(
            destination: '/sub/chat/room/$roomId',
            callback: (StompFrame frame) {
              if (frame.body != null) {
                logger.d("🔹 메시지 내용: ${frame.body}");

                onMessageReceived(frame.body);
              }
            },
          );
          completer.complete();
        },
      ),
    );

    _stompClient?.activate();
    return completer.future;
  }

  // 메시지 전송
  void sendMessage({
    required String message,
  }) {
    if (_stompClient == null) {
      logger.w("⚠️ [WebSocket] 메시지 전송 실패: WebSocket이 연결되지 않음");
      return;
    }

    final chatMessage = {
      'message': message,
    };

    try {
      _stompClient?.send(
        destination: '/pub/chat/message',
        body: jsonEncode(chatMessage),
      );
    } catch (e) {
      logger.e("❌ [WebSocket] 메시지 전송 실패: $e");
    }
  }

  // WebSocket 연결 해제
  void disconnect() {
    if (_stompClient != null) {
      _stompClient?.deactivate();
      logger.i("✅ [WebSocket] 연결 해제 완료");
    } else {
      logger.w("⚠️ [WebSocket] 이미 해제된 상태");
    }
  }
}