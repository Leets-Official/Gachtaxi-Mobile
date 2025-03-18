import 'package:flutter/widgets.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

abstract class MessageStrategy {
  Widget buildMessage(ChatMessageModel message, bool isMine, bool showProfile, bool showTime);
}
