import 'dart:convert';

import 'package:gachtaxi_app/common/util/logger.dart';
import 'package:gachtaxi_app/common/util/token_storage.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class ChatWebsocketService {

  static StompClient? _stompClient;

  // WebSocket 연결
  static Future<void> connect({
    required int roomId,
    required Function(dynamic) onMessageReceived,
  }) async {
    final token = await TokenStorage.loadAccessToken();

    logger.i("🔗 [WebSocket] 연결 시도 - 채팅방 ID: $roomId");
    if (token == null || token.isEmpty) {
      logger.e("❌ [WebSocket] 연결 실패: 토큰이 없습니다.");
      return;
    }

    final Map<String, String> finalHeaders = {
      'Authorization': 'Bearer $token',
    };

    logger.d("🛠 [WebSocket] 최종 요청 헤더: $finalHeaders");

    _stompClient = StompClient(
      config: StompConfig(
        url: 'ws://localhost:8080/ws', //ws://10.0.2.2:8080/ws  | 안드로이드는 localhost를 에뮬레이터로 알기 때문에 이렇게 해줘야함
        // 서버 주소
        stompConnectHeaders: finalHeaders,

        onConnect: (StompFrame frame) {
          logger.i("✅ [WebSocket] STOMP 연결 성공");

          // 구독 (특정 채팅방의 메시지 수신)
          _stompClient?.subscribe(
            destination: '/sub/chat/room/$roomId',
            callback: (StompFrame frame) {
              if (frame.body != null) {
                logger.i("📩 [WebSocket] 새 메시지 수신");
                logger.d("🔹 메시지 내용: ${frame.body}");

                onMessageReceived(frame.body);
              }
            },
          );
        },
        onDisconnect: (StompFrame frame) {
          logger.w("❌ [WebSocket] STOMP 연결 해제됨");
        },
        onWebSocketError: (dynamic error) {
          logger.e("❌ [WebSocket] 오류 발생: $error");
        },
      ),
    );

    _stompClient?.activate();
  }

  // 메시지 전송
  static void sendMessage({
    required String message,
  }) {
    if (_stompClient == null) {
      logger.w("⚠️ [WebSocket] 메시지 전송 실패: WebSocket이 연결되지 않음");
      return;
    }

    final chatMessage = {
      'message': message,
    };

    logger.i("📤 [WebSocket] 메시지 전송");
    logger.d("🔹 메시지 본문: $chatMessage");

    try {
      _stompClient?.send(
        destination: '/pub/chat/message',
        body: jsonEncode(chatMessage),
      );
      logger.i("✅ [WebSocket] 메시지 전송 성공");
    } catch (e) {
      logger.e("❌ [WebSocket] 메시지 전송 실패: $e");
    }
  }

  // WebSocket 연결 해제
  static void disconnect() {
    if (_stompClient != null) {
      logger.w("❌ [WebSocket] 연결 해제 중...");
      _stompClient?.deactivate();
      logger.i("✅ [WebSocket] 연결 해제 완료");
    } else {
      logger.w("⚠️ [WebSocket] 이미 해제된 상태");
    }
  }
}