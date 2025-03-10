import 'package:flutter/widgets.dart';
import 'package:gachtaxi_app/domain/chat/application/factory/abstract_message_strategy.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

class ReadMessageStrategy implements MessageStrategy {
  @override
  Widget buildMessage(ChatMessageModel message, bool isMine, bool showProfile, bool showTime) {
    /*
    todo 읽음 처리 로직 추가
     */
    return const SizedBox.shrink();
  }
}
