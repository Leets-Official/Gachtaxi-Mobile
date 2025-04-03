import 'package:gachtaxi_app/domain/chat/data/enums/chat_message_type.dart';
import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

class MessageGroupingUtil {
  static Map<String, bool> getProfileVisibility(List<ChatMessageModel> messages) {
    final visibilityMap = <String, bool>{};
    ChatMessageModel? previous;

    for (int i = 0; i < messages.length; i++) {
      final current = messages[i];

      // ENTER나 EXIT는 항상 프로필 숨김 (아예 UI에서 따로 처리할 수도 있음)
      if (current.messageType != MessageType.MESSAGE) {
        visibilityMap[current.messageId ?? "0"] = false;
        continue;
      }

      if (previous == null || previous.messageType != MessageType.MESSAGE) {
        // 이전 메시지가 없거나, 이전 메시지가 ENTER/EXIT이면 무조건 표시
        visibilityMap[current.messageId ?? "0"] = true;
      } else {
        final isSameSender = current.senderId == previous.senderId;
        final isSameMinute = _isSameMinute(current.timeStamp, previous.timeStamp);
        visibilityMap[current.messageId ?? "0"] = !(isSameSender && isSameMinute);
      }

      previous = current;
    }

    return visibilityMap;
  }

  static Map<String, bool> getTimeVisibility(List<ChatMessageModel> messages) {
    final timeVisibilityMap = <String, bool>{};

    for (int i = 0; i < messages.length; i++) {
      final current = messages[i];

      if (current.messageType != MessageType.MESSAGE) {
        timeVisibilityMap[current.messageId ?? "0"] = false;
        continue;
      }

      final next = (i < messages.length - 1) ? messages[i + 1] : null;

      if (next == null || next.messageType != MessageType.MESSAGE) {
        timeVisibilityMap[current.messageId ?? "0"] = true;
      } else {
        final isSameSender = current.senderId == next.senderId;
        final isSameMinute = _isSameMinute(current.timeStamp, next.timeStamp);
        timeVisibilityMap[current.messageId ?? "0"] = !(isSameSender && isSameMinute);
      }
    }

    return timeVisibilityMap;
  }

  static bool _isSameMinute(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day &&
        first.hour == second.hour &&
        first.minute == second.minute;
  }
}
