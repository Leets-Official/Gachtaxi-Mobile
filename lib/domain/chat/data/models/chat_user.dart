class ChatUserModel {
  final String name;
  final String profilePicture;
  final bool isOwner;
  final bool isMe;

  ChatUserModel({
    required this.name,
    required this.profilePicture,
    this.isOwner = false,
    this.isMe = false,
  });
}