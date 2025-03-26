import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gachtaxi_app/common/util/logger.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/chat_message_factory.dart';
import 'package:gachtaxi_app/domain/chat/application/util/message_grouping_util.dart';
import 'package:gachtaxi_app/domain/chat/data/enums/chat_message_type.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';
import 'package:gachtaxi_app/domain/chat/data/repository/chat_repository.dart';
import 'package:gachtaxi_app/domain/chat/presentation/state/chat_state.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_new_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_view_model.g.dart';

@riverpod
class ChatViewModel extends _$ChatViewModel {
  @override
  ChatState build() {
    final repository = ref.watch(chatRepositoryProvider);
    _repository = repository;

    ref.onDispose(() {
      _repository.disconnect();
    });

    return const ChatState();
  }


  late final ChatRepository _repository;

  Future<void> connectWebSocket({
    required int roomId,
  }) async {
    await _repository.connect(
      roomId: roomId,
      onMessageReceived: _handleIncomingMessage,
    );
  }

  void _handleIncomingMessage(dynamic message) {
    try {
      final decoded = jsonDecode(message);
      final newMessage = ChatMessageModel.fromJson(decoded);

      if (newMessage.messageType == MessageType.MESSAGE ||
          newMessage.messageType == MessageType.ENTER ||
          newMessage.messageType == MessageType.EXIT) {
        final updatedMessages = [...state.messageState.messages, newMessage];
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
        fetchMemberCount(roomId: message.roomId);
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

    final updated = state.messageState.messages.map((msg) {
      if (msg.messageId == startMessageId) {
        return msg.copyWith(unreadCount: (msg.unreadCount ?? 0) - 1);
      } else if (msg.messageId == endMessageId) {
        return msg.copyWith(unreadCount: (msg.unreadCount ?? 0) - 1);
      } else {
        return msg;
      }
    }).toList();

    state = state.copyWith(
      messageState: state.messageState.copyWith(messages: updated),
    );
  }

  Future<void> fetchMemberCount({required int roomId}) async {
    try {
      final response = await _repository.fetchMemberCount(roomId);
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
      final data = await _repository.fetchMessages(
        roomId: roomId,
        pageNumber: 0,
      );
      final reversed = data.chattingMessage.reversed.toList();

      state = state.copyWith(
        messageState: state.messageState.copyWith(
          messages: reversed,
          pageNum: 0,
          hasMoreData: !data.pageable.last,
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

    try {
      final data = await _repository.fetchMessages(
        roomId: roomId,
        pageNumber: state.messageState.pageNum + 1,
        lastMessageTimeStamp: state.messageState.lastMessageTimeStamp,
      );

      final reversedNew = data.chattingMessage.reversed.toList();

      state = state.copyWith(
        messageState: state.messageState.copyWith(
          messages: [...reversedNew, ...state.messageState.messages],
          pageNum: state.messageState.pageNum + 1,
          hasMoreData: !data.pageable.last,
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
    required List<ChatMessageModel> messages,
    required DateTime? disconnectedAt,
    required bool showNewMessagesIndicator,
    required int myUserId,
  }) {
    final profileVisibilityMap = MessageGroupingUtil.getProfileVisibility(messages);
    final timeVisibilityMap = MessageGroupingUtil.getTimeVisibility(messages);

    final List<Widget> messageWidgets = [];
    bool newMessagesInserted = false;

    for (final message in messages) {
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


  void sendMessage(String text) {
    _repository.sendMessage(text);
  }

  void disconnect() {
    _repository.disconnect();
  }
}