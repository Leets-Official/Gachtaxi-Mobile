import '../enums/chat_message_type.dart';

class ChatMessageModel {
  final String? messageId;
  final int? roomId;
  final int senderId;
  final String senderName;
  final String? message;
  final String? profilePicture;
  int? unreadCount;
  final DateTime timeStamp;
  final MessageType messageType;
  final String? startMessageId;
  final String? endMessageId;

  ChatMessageModel({
    this.messageId,
    this.roomId,
    required this.senderId,
    required this.senderName,
    this.message,
    this.profilePicture,
    this.unreadCount,
    required this.timeStamp,
    required this.messageType,
    this.startMessageId,
    this.endMessageId,
  });
}
