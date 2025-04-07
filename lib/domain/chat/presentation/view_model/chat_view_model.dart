import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gachtaxi_app/common/util/logger.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/chat_message_factory.dart';
import 'package:gachtaxi_app/domain/chat/application/util/message_grouping_util.dart';
import 'package:gachtaxi_app/domain/chat/data/enums/chat_message_type.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';
import 'package:gachtaxi_app/domain/chat/data/repository/chat_service.dart';
import 'package:gachtaxi_app/domain/chat/presentation/state/chat_state.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_new_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_view_model.g.dart';

@riverpod
class ChatViewModel extends _$ChatViewModel {
  @override
  ChatState build() {
    final service = ref.watch(chatServiceProvider);
    _service = service;

    ref.onDispose(() {
      _service.disconnect();
    });

    return ChatState();
  }

  late final ChatService _service;

  void _handleIncomingMessage(dynamic message) {
    try {
      final decoded = jsonDecode(message);
      final newMessage = ChatMessageModel.fromJson(decoded);

      if (newMessage.messageType == MessageType.MESSAGE ||
          newMessage.messageType == MessageType.ENTER ||
          newMessage.messageType == MessageType.EXIT) {
        final updatedMessages = ListQueue.of(state.messageState.messages)..addLast(newMessage);
        state = state.copyWith(
          messageState: state.messageState.copyWith(
            messages: updatedMessages,
          ),
        );
      } else if (newMessage.messageType == MessageType.READ) {
        _updateUnreadCounts(decoded);
      }

      if (newMessage.messageType == MessageType.ENTER ||
          newMessage.messageType == MessageType.EXIT) {
        fetchMemberCount(roomId: newMessage.roomId!);
      }
    } catch (e) {
      logger.e("❌ WebSocket 메시지 파싱 실패: $e");
    }
  }

  void _updateUnreadCounts(Map<String, dynamic> readMessage) {
    final String startMessageId = readMessage["range"]["startMessageId"];
    final String endMessageId = readMessage["range"]["endMessageId"];

    if (startMessageId == "NO_MESSAGES" || endMessageId == "NO_MESSAGES")
      return;

    final updated = ListQueue.of(state.messageState.messages.map((msg) {
      if (msg.messageId == startMessageId) {
        return msg.copyWith(unreadCount: (msg.unreadCount ?? 0) - 1);
      } else if (msg.messageId == endMessageId) {
        return msg.copyWith(unreadCount: (msg.unreadCount ?? 0) - 1);
      } else {
        return msg;
      }
    }));

    state = state.copyWith(
      messageState: state.messageState.copyWith(messages: updated),
    );
  }

  Future<void> fetchMemberCount({required int roomId}) async {
    try {
      final response = await _service.fetchMemberCount(roomId);
      state = state.copyWith(
        metaState: state.metaState.copyWith(
          memberCount: response.totalParticipantCount,
        ),
      );
    } catch (e) {
      logger.w("인원 수 조회 실패: $e");
    }
  }

  Future<void> loadInitialMessages(int roomId) async {
    state = state.copyWith(
      uiState: state.uiState.copyWith(isLoading: true),
    );

    try {
      final data = await _service.fetchMessages(
        roomId: roomId,
        pageNumber: 0,
      );
      final reversed = ListQueue.of(data.chattingMessage.reversed);

      state = state.copyWith(
        messageState: state.messageState.copyWith(
          messages: reversed,
          pageNum: 0,
          hasMoreData: !data.pageable.isLast,
          lastMessageTimeStamp: reversed.isNotEmpty
              ? reversed.first.timeStamp.toIso8601String()
              : null,
        ),
        uiState: state.uiState.copyWith(
          isLoading: false,
          disconnectedAt: data.disconnectedAt,
          showNewMessagesIndicator: data.disconnectedAt != null &&
              reversed.any((m) => m.timeStamp.isAfter(data.disconnectedAt!)),
        ),
      );
    } catch (e) {
      logger.e("메시지 초기 로딩 실패: $e");
      state = state.copyWith(
        uiState: state.uiState.copyWith(isLoading: false),
      );
    }
  }

  Future<void> loadMoreMessages(int roomId) async {
    if (state.uiState.isFetchingMore || !state.messageState.hasMoreData) return;

    state = state.copyWith(
      uiState: state.uiState.copyWith(isFetchingMore: true),
    );

    final nextPage = state.messageState.pageNum + 1;

    try {
      final data = await _service.fetchMessages(
        roomId: roomId,
        pageNumber: nextPage,
        lastMessageTimeStamp: state.messageState.lastMessageTimeStamp,
      );

      final reversedNew = ListQueue.of(data.chattingMessage.reversed);
      final combined = ListQueue.of(reversedNew)..addAll(state.messageState.messages);

      state = state.copyWith(
        messageState: state.messageState.copyWith(
          messages: combined,
          pageNum: state.messageState.pageNum + 1,
          hasMoreData: !data.pageable.isLast,
        ),
        uiState: state.uiState.copyWith(isFetchingMore: false),
      );
    } catch (e) {
      logger.e("추가 메시지 로딩 실패: $e");
      state = state.copyWith(
        uiState: state.uiState.copyWith(isFetchingMore: false),
      );
    }
  }

  List<Widget> buildMessageList({
    required ListQueue<ChatMessageModel> messages,
    required DateTime? disconnectedAt,
    required bool showNewMessagesIndicator,
    required int myUserId,
  }) {
    final messageList = messages.toList();
    final profileVisibilityMap = MessageGroupingUtil.getProfileVisibility(messageList);
    final timeVisibilityMap = MessageGroupingUtil.getTimeVisibility(messageList);

    final List<Widget> messageWidgets = [];
    bool newMessagesInserted = false;

    for (final message in messageList) {
      final isAfterDisconnect =
          disconnectedAt != null && message.timeStamp.isAfter(disconnectedAt);

      if (!newMessagesInserted && showNewMessagesIndicator && isAfterDisconnect) {
        messageWidgets.add(const NewMessagesIndicator());
        newMessagesInserted = true;
      }

      messageWidgets.add(
        MessageUIFactory.getMessageWidget(
          message: message,
          isMine: message.senderId == myUserId,
          showProfile: profileVisibilityMap[message.messageId ?? "0"] ?? true,
          showTime: timeVisibilityMap[message.messageId ?? "0"] ?? true,
        ),
      );
    }

    return messageWidgets;
  }

  Future<void> connectWebSocket({
    required int roomId,
  }) async {
    await _service.connect(
      roomId: roomId,
      onMessageReceived: _handleIncomingMessage,
    );
  }

  void sendMessage(String text) {
    _service.sendMessage(text);
  }

  void disconnect() {
    _service.disconnect();
  }
}
