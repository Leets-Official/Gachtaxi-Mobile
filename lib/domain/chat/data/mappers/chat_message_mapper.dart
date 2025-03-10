import 'package:gachtaxi_app/domain/chat/data/enums/chat_message_type.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

class ChatMessageMapper {
  // 🔥 JSON → ChatMessageModel 변환
  static ChatMessageModel fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      messageId: json['messageId'],
      roomId: json['roomId'],
      senderId: json['senderId'],
      senderName: json['senderName'],
      message: json['message'],
      profilePicture: json['profilePicture'],
      unreadCount: json['unreadCount'],
      timeStamp: DateTime.parse(json['timeStamp']),
      messageType: MessageType.parseMessageType(json['messageType']),
      startMessageId: json['range']?['startMessageId'],
      endMessageId: json['range']?['endMessageId'],
    );
  }
}
