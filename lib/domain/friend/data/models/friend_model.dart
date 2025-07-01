import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/enums/gender_model.dart';

part 'friend_model.freezed.dart';
part 'friend_model.g.dart';

@freezed
class Friend with _$Friend {
  const factory Friend({
    required int friendsId,
    required String friendsNickName,
    required String friendsProfileUrl,
    required Gender gender,
    required int chatRoomId,
  }) = _Friend;

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
}
