import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

class ChatState {
  final ChatMessageState messageState;
  final ChatUiState uiState;
  final ChatMetaState metaState;

  const ChatState({
    this.messageState = const ChatMessageState(),
    this.uiState = const ChatUiState(),
    this.metaState = const ChatMetaState(),
  });

  ChatState copyWith({
    ChatMessageState? messageState,
    ChatUiState? uiState,
    ChatMetaState? metaState,
  }) {
    return ChatState(
      messageState: messageState ?? this.messageState,
      uiState: uiState ?? this.uiState,
      metaState: metaState ?? this.metaState,
    );
  }
}

class ChatMessageState {
  final List<ChatMessageModel> messages;
  final bool hasMoreData;
  final int pageNum;
  final String? lastMessageTimeStamp;

  const ChatMessageState({
    this.messages = const [],
    this.hasMoreData = true,
    this.pageNum = 0,
    this.lastMessageTimeStamp,
  });

  ChatMessageState copyWith({
    List<ChatMessageModel>? messages,
    bool? hasMoreData,
    int? pageNum,
    String? lastMessageTimeStamp,
  }) {
    return ChatMessageState(
      messages: messages ?? this.messages,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      pageNum: pageNum ?? this.pageNum,
      lastMessageTimeStamp: lastMessageTimeStamp ?? this.lastMessageTimeStamp,
    );
  }
}

class ChatUiState {
  final bool isLoading;
  final bool isFetchingMore;
  final bool showNewMessagesIndicator;
  final DateTime? disconnectedAt;

  const ChatUiState({
    this.isLoading = false,
    this.isFetchingMore = false,
    this.showNewMessagesIndicator = false,
    this.disconnectedAt,
  });

  ChatUiState copyWith({
    bool? isLoading,
    bool? isFetchingMore,
    bool? showNewMessagesIndicator,
    DateTime? disconnectedAt,
  }) {
    return ChatUiState(
      isLoading: isLoading ?? this.isLoading,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
      showNewMessagesIndicator:
      showNewMessagesIndicator ?? this.showNewMessagesIndicator,
      disconnectedAt: disconnectedAt ?? this.disconnectedAt,
    );
  }
}

// 인원 수 + 참여자 정보 저장
class ChatMetaState {
  final int memberCount;

  const ChatMetaState({this.memberCount = 0});

  ChatMetaState copyWith({int? memberCount}) {
    return ChatMetaState(
      memberCount: memberCount ?? this.memberCount,
    );
  }
}
