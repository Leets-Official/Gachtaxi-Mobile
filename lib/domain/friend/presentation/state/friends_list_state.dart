import 'package:gachtaxi_app/domain/friend/data/models/friend_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friends_list_state.g.dart';

@Riverpod(keepAlive: true)
class FriendsListState extends _$FriendsListState {
  @override
  List<Friend> build() {
    return [];
  }

  void addFriends(List<Friend> friends) {
    state = [...state, ...friends];
  }
}
