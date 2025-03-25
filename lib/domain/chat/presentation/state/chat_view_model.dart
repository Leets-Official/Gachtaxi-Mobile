import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/chat_message_factory.dart';
import 'package:gachtaxi_app/domain/chat/application/util/message_grouping_helper.dart';
import 'package:gachtaxi_app/domain/chat/data/enums/chat_message_type.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';
import 'package:gachtaxi_app/domain/chat/data/repository/chat_member_repository.dart';
import 'package:gachtaxi_app/domain/chat/data/repository/chat_message_repository.dart';
import 'package:gachtaxi_app/domain/chat/data/repository/chat_websocket_repository.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_new_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_view_model.g.dart';

/// 채팅 상태를 나타내는 클래스
class ChatState {
  final List<ChatMessageModel> messages;
  final bool isLoading;
  final bool isConnected;
  final int memberCount;
  final int pageNumber;
  final bool hasMoreData;
  final String? lastMessageTimeStamp;
  final DateTime? disconnectedAt;
  final bool isFetchingMore;
  final bool showNewMessagesIndicator;

  const ChatState({
    required this.messages,
    required this.isLoading,
    required this.isConnected,
    required this.memberCount,
    required this.pageNumber,
    required this.hasMoreData,
    required this.lastMessageTimeStamp,
    required this.disconnectedAt,
    required this.isFetchingMore,
    required this.showNewMessagesIndicator,
  });

  /// 기본 상태
  factory ChatState.initial() => const ChatState(
    messages: [],
    isLoading: false,
    isConnected: false,
    memberCount: 0,
    pageNumber: 0,
    hasMoreData: true,
    lastMessageTimeStamp: null,
    disconnectedAt: null,
    isFetchingMore: false,
    showNewMessagesIndicator: false,
  );

  /// copyWith
  ChatState copyWith({
    List<ChatMessageModel>? messages,
    bool? isLoading,
    bool? isConnected,
    int? memberCount,
    int? pageNumber,
    bool? hasMoreData,
    String? lastMessageTimeStamp,
    DateTime? disconnectedAt,
    bool? isFetchingMore,
    bool? showNewMessagesIndicator,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      isConnected: isConnected ?? this.isConnected,
      memberCount: memberCount ?? this.memberCount,
      pageNumber: pageNumber ?? this.pageNumber,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      lastMessageTimeStamp: lastMessageTimeStamp ?? this.lastMessageTimeStamp,
      disconnectedAt: disconnectedAt ?? this.disconnectedAt,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
      showNewMessagesIndicator: showNewMessagesIndicator ?? this.showNewMessagesIndicator,
    );
  }
}

@riverpod
class ChatViewModel extends _$ChatViewModel {
  @override
  ChatState build() => ChatState.initial();

  /// 초기 메시지 로딩 (최신→과거, 클라이언트는 오래된→최신)
  Future<void> loadMessages(int roomId) async {
    state = state.copyWith(isLoading: true);
    final response = await ref.read(chatMessageRepositoryProvider).fetchMessages(roomId, 0);

    // [오래된→최신]으로 정렬
    final sorted = [...response.chattingMessage]..sort((a, b) => a.timeStamp.compareTo(b.timeStamp));

    // disconnectedAt 이후 메시지가 있으면 NewIndicator
    final showIndicator = response.disconnectedAt != null &&
        sorted.any((m) => m.timeStamp.isAfter(response.disconnectedAt!));

    state = state.copyWith(
      messages: sorted,
      isLoading: false,
      disconnectedAt: response.disconnectedAt,
      showNewMessagesIndicator: showIndicator,
    );
  }

  /// 더 오래된 메시지 로딩
  Future<void> loadMoreMessages(
      int roomId, {
        required double oldOffset,
        required double oldMaxExtent,
        required void Function(double diff) onScrolled,
      }) async {
    if (state.isFetchingMore || !state.hasMoreData) return;

    state = state.copyWith(isFetchingMore: true);
    try {
      final res = await ref.read(chatMessageRepositoryProvider).fetchMessages(
        roomId,
        state.pageNumber + 1,
        lastMessageTimeStamp: state.lastMessageTimeStamp,
      );

      // 새 데이터도 [오래된 → 최신]
      final reversedNew = res.chattingMessage.reversed.toList();
      if (reversedNew.isEmpty) return;

      final updatedList = [...reversedNew, ...state.messages];
      final updatedLastTimestamp = updatedList.first.timeStamp.toIso8601String();

      state = state.copyWith(
        messages: updatedList,
        pageNumber: state.pageNumber + 1,
        lastMessageTimeStamp: updatedLastTimestamp,
        hasMoreData: !res.pageable.last,
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 스크롤 위치 보정
        final newMaxExtent = oldMaxExtent + 500;
        final diff = newMaxExtent - oldMaxExtent;
        onScrolled(diff);
      });
    } catch (e) {
      print("❌ loadMoreMessages 실패: $e");
    } finally {
      state = state.copyWith(isFetchingMore: false);
    }
  }

  /// 웹소켓 메시지 수신 처리
  void _onMessageReceived(dynamic raw) {
    final data = jsonDecode(raw);
    final msg = ChatMessageModel.fromJson(data);

    if (msg.messageType == MessageType.READ) {
      _handleReadRange(data);
      return;
    }

    final updated = [...state.messages, msg];
    state = state.copyWith(messages: updated);

    if (msg.messageType == MessageType.ENTER || msg.messageType == MessageType.EXIT) {
      fetchMemberCount(msg.roomId!);
    }
  }

  /// 읽음 범위 처리
  void _handleReadRange(Map<String, dynamic> json) {
    final start = json['range']['startMessageId'];
    final end = json['range']['endMessageId'];
    if (start == 'NO_MESSAGES' || end == 'NO_MESSAGES') return;

    final newList = state.messages.map((m) {
      if (m.messageId == null) return m;
      if (m.messageId!.compareTo(start) >= 0 && m.messageId!.compareTo(end) <= 0) {
        return m.copyWith(unreadCount: (m.unreadCount ?? 0) - 1);
      }
      return m;
    }).toList();

    state = state.copyWith(messages: newList);
  }

  /// 메시지 전송
  void sendMessage(String content) {
    ref.read(chatSocketRepositoryProvider).sendMessage(content);
  }

  /// 웹소켓 연결
  Future<void> connectWebSocket(int roomId) async {
    await ref.read(chatSocketRepositoryProvider).connect(
      roomId: roomId,
      onMessageReceived: _onMessageReceived,
    );
    state = state.copyWith(isConnected: true);
  }

  /// 웹소켓 해제
  void disconnectWebSocket() {
    ref.read(chatSocketRepositoryProvider).disconnect();
    state = state.copyWith(isConnected: false);
  }

  /// 참여자 수 갱신
  Future<void> fetchMemberCount(int roomId) async {
    final res = await ref.read(chatMemberRepositoryProvider).fetchMemberCount(roomId);
    state = state.copyWith(memberCount: res.totalParticipantCount);
  }

  /// 메시지 + NewIndicator + 프로필/시간 표시
  List<Widget> get renderMessages {
    final msgs = state.messages;
    final profileMap = MessageGroupingHelper.getProfileVisibility(msgs);
    final timeMap = MessageGroupingHelper.getTimeVisibility(msgs);

    // 토큰에서 불러오기 or 전역 상태
    const myUserId = 1;

    final List<Widget> widgets = [];
    bool insertedIndicator = false;

    for (final m in msgs) {
      if (!insertedIndicator &&
          state.showNewMessagesIndicator &&
          state.disconnectedAt != null &&
          m.timeStamp.isAfter(state.disconnectedAt!)) {
        widgets.add(const NewMessagesIndicator());
        insertedIndicator = true;
      }

      widgets.add(
        MessageUIFactory.getMessageWidget(
          message: m,
          isMine: m.senderId == myUserId,
          showProfile: profileMap[m.messageId ?? ''] ?? true,
          showTime: timeMap[m.messageId ?? ''] ?? true,
        ),
      );
    }
    return widgets;
  }
}
