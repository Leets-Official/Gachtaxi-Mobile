enum MessageType {
  READ,
  ENTER,
  MESSAGE,
  EXIT;

  // 메시지 타입을 Enum으로 변환
  static MessageType parseMessageType(String type) {
    switch (type) {
      case "READ":
        return MessageType.READ;
      case "ENTER":
        return MessageType.ENTER;
      case "MESSAGE":
        return MessageType.MESSAGE;
      case "EXIT":
        return MessageType.EXIT;
      default:
        throw Exception("알 수 없는 메시지 타입: $type");
    }
  }
}