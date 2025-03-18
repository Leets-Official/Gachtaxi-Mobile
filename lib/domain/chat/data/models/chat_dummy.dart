import 'package:gachtaxi_app/domain/chat/data/enums/chat_message_type.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

class ChatDummy {
  static List<ChatMessageModel> generateDummyMessages() {
    return [
      ChatMessageModel(
        senderId: 3,
        senderName: "이영희",
        message: null,
        profilePicture: "https://randomuser.me/api/portraits/women/3.jpg",
        unreadCount: 0,
        timeStamp: DateTime.now().subtract(const Duration(minutes: 2)),
        messageType: MessageType.ENTER,
      ),
      ChatMessageModel(
        senderId: 1,
        senderName: "홍길동",
        message: "안녕하세요! 😀",
        profilePicture: "https://randomuser.me/api/portraits/men/1.jpg",
        unreadCount: 2,
        timeStamp: DateTime.now().subtract(const Duration(minutes: 5)),
        messageType: MessageType.MESSAGE,
      ),
      ChatMessageModel(
        senderId: 1,
        senderName: "홍길동",
        message: "안녕하세요! 😀",
        profilePicture: "https://randomuser.me/api/portraits/men/1.jpg",
        unreadCount: 2,
        timeStamp: DateTime.now().subtract(const Duration(minutes: 5)),
        messageType: MessageType.MESSAGE,
      ),
      ChatMessageModel(
        senderId: 2,
        senderName: "김철수",
        message: "안녕하세요! 반가워요!",
        profilePicture: "https://randomuser.me/api/portraits/men/2.jpg",
        unreadCount: 1,
        timeStamp: DateTime.now().subtract(const Duration(minutes: 4)),
        messageType: MessageType.MESSAGE,
      ),
      ChatMessageModel(
        senderId: 1,
        senderName: "홍길동",
        message: "채팅 화면 UI 테스트 중입니다.채팅 화면 UI 테스트 중입니다.채팅 화면 UI 테스트 중입니다.채팅 화면 UI 테스트 중입니다.",
        profilePicture: "",
        unreadCount: 1,
        timeStamp: DateTime.now().subtract(const Duration(minutes: 3)),
        messageType: MessageType.MESSAGE,
      ),

      ChatMessageModel(
        senderId: 2,
        senderName: "김철수",
        message: "화면 반응형 적용했나요?화면 반응형 적용했나요?화면 반응형 적용했나요?화면 반응형 적용했나요?화면 반응형 적용했나요?화면 반응형 적용했나요?",
        profilePicture: "",
        unreadCount: 1,
        timeStamp: DateTime.now().subtract(const Duration(minutes: 1)),
        messageType: MessageType.MESSAGE,
      ),
      ChatMessageModel(
        senderId: 2,
        senderName: "김철수",
        message: """
        
        """,
        profilePicture: "",
        unreadCount: 1,
        timeStamp: DateTime.now().subtract(const Duration(minutes: 1)),
        messageType: MessageType.MESSAGE,
      ),
      ChatMessageModel(
        senderId: 3,
        senderName: "이영희",
        message: null,
        profilePicture: "https://randomuser.me/api/portraits/women/3.jpg",
        unreadCount: 0,
        timeStamp: DateTime.now().subtract(const Duration(minutes: 2)),
        messageType: MessageType.EXIT,
      ),
    ];
  }
}
