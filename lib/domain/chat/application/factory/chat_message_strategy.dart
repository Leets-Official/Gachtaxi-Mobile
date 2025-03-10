import 'package:flutter/widgets.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/abstract_message_strategy.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_message.dart';

class TextMessageStrategy implements MessageStrategy {
  @override
  Widget buildMessage(ChatMessageModel message, bool isMine, bool showProfile, bool showTime) {
    return ChatMessage(
      message: message,
      isMine: isMine,
      showProfileAndName: showProfile,
      showTime: showTime,
    );
  }
}
