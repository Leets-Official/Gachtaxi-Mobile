import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';

part 'chat_message_response.freezed.dart';
part 'chat_message_response.g.dart';

@freezed
class ChatMessageResponse with _$ChatMessageResponse {
  const factory ChatMessageResponse({
    required int memberId,
    required DateTime disconnectedAt,
    required List<ChatMessageModel> chattingMessage,
    required Pageable pageable,
  }) = _ChatMessageResponse;

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);
}
