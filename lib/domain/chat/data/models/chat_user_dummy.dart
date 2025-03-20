import 'package:gachtaxi_app/domain/chat/data/models/chat_user.dart';

class ChatUserDummy {
  ChatUserDummy._();

  static List<ChatUserModel> generateUserDummy() {
    return [
      ChatUserModel(
        name: "친구 1",
        profilePicture: "https://randomuser.me/api/portraits/women/3.jpg",
        isOwner: true,
        isMe: true,
      ),
      ChatUserModel(
        name: "친구 2",
        profilePicture: "https://randomuser.me/api/portraits/women/4.jpg",
      ),
      ChatUserModel(
        name: "친구 3",
        profilePicture: "https://randomuser.me/api/portraits/men/5.jpg",
      ),
      ChatUserModel(
        name: "친구 4",
        profilePicture: "",
        isOwner: true,
      ),
    ];
  }
}
