import 'package:gachtaxi_app/domain/chat/data/models/chat_message_model.dart';

class MessageGroupingHelper {
  static Map<String, bool> getProfileVisibility(List<ChatMessageModel> messages) {
    Map<String, bool> visibilityMap = {};
    ChatMessageModel? previousMessage;

    for (int i = 0; i < messages.length; i++) {
      final currentMessage = messages[i];

      // 첫 번째 메시지는 무조건 표시
      if (previousMessage == null) {
        visibilityMap[currentMessage.messageId ?? "0"] = true;
      } else {
        final currentTime = currentMessage.timeStamp;
        final previousTime = previousMessage.timeStamp;
        final isSameSender = currentMessage.senderId == previousMessage.senderId;
        final isSameMinute = _isSameMinute(currentMessage.timeStamp, previousMessage.timeStamp);

        // 같은 발신자가 1분 이내에 보낸 경우 → 숨기고, 새로운 그룹이면 표시
        visibilityMap[currentMessage.messageId ?? "0"] = !(isSameSender && isSameMinute);
      }

      // 현재 메시지를 `previousMessage`로 업데이트하여 다음 비교에 활용
      previousMessage = currentMessage;
    }

    return visibilityMap;
  }

  static Map<String, bool> getTimeVisibility(List<ChatMessageModel> messages) {
    Map<String, bool> timeVisibilityMap = {};

    for (int i = 0; i < messages.length; i++) {
      final currentMessage = messages[i];
      final nextMessage = (i < messages.length - 1) ? messages[i + 1] : null;

      if (nextMessage == null) {
        // 마지막 메시지는 무조건 시간 표시
        timeVisibilityMap[currentMessage.messageId ?? "0"] = true;
      } else {
        final nextTime = nextMessage.timeStamp;
        final isSameSender = currentMessage.senderId == nextMessage.senderId;
        final isSameMinute = _isSameMinute(currentMessage.timeStamp, nextMessage.timeStamp);

        // 같은 발신자가 1분 이내에 보낸 경우, 마지막 메시지에서만 시간 표시
        timeVisibilityMap[currentMessage.messageId ?? "0"] = !(isSameSender && isSameMinute);

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