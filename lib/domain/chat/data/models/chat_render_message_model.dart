import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

part 'chat_render_message_model.freezed.dart';
part 'chat_render_message_model.g.dart';

@freezed
class ChatRenderMessageModel with _$ChatRenderMessageModel {

  const factory ChatRenderMessageModel({
    required ChatMessageModel message,
    required bool isMine,
    required bool showProfile,
    required bool showTime,
  }) = _ChatRenderMessageModel;

  factory ChatRenderMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRenderMessageModelFromJson(json);
}

