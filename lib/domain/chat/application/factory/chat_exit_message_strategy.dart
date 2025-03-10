import 'package:flutter/widgets.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/abstract_message_strategy.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';
import 'package:gachtaxi_app/domain/chat/presentation/widget/chat_enter_exit_message.dart';

class ExitMessageStrategy implements MessageStrategy {
  @override
  Widget buildMessage(ChatMessageModel message, bool isMine, bool showProfile, bool showTime) {
    return ChatEnterExitMessage(
      messageText: "${message.senderName} 님이 퇴장하셨습니다.",
    );
  }
}
