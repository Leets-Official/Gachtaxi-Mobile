import 'package:gachtaxi_app/common/enums/friend_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_changer_notifier.g.dart';

@riverpod
class FriendChangerNotifier extends _$FriendChangerNotifier {
  @override
  FriendCategory build() => FriendCategory.friend;

  void toggleCategory() {
    state = state == FriendCategory.friend
        ? FriendCategory.blackList
        : FriendCategory.friend;
  }
}
