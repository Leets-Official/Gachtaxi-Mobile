import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/domain/chat/data/enums/chat_message_type.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    String? messageId,
    int? roomId,
    required int senderId,
    required String senderName,
    String? message,
    String? profilePicture,
    int? unreadCount,
    required DateTime timeStamp,
    required MessageType messageType,
    String? startMessageId,
    String? endMessageId,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}
