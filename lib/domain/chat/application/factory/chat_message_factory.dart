import 'package:flutter/widgets.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/chat_enter_message_strategy.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/chat_message_strategy.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/chat_read_strategy.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/abstract_message_strategy.dart';
import 'package:gachtaxi_app/domain/chat/data/enums/chat_message_type.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

import 'chat_exit_message_strategy.dart';

class MessageUIFactory {
  static final Map<MessageType, MessageStrategy> _strategies = {
    MessageType.MESSAGE: TextMessageStrategy(),
    MessageType.ENTER: EnterMessageStrategy(),
    MessageType.EXIT: ExitMessageStrategy(),
    MessageType.READ: ReadMessageStrategy(),
  };

  static Widget getMessageWidget({
    required ChatMessageModel message,
    required bool isMine,
    required bool showProfile,
    required bool showTime,
  }) {
    return (_strategies[message.messageType] ?? TextMessageStrategy())
        .buildMessage(message, isMine, showProfile, showTime);
  }
}
