import 'package:gachtaxi_app/domain/friend/application/friend_constant.dart';
import 'package:gachtaxi_app/domain/friend/data/models/member_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_search_state.g.dart';

@riverpod
class FriendSearchState extends _$FriendSearchState {
  @override
  List<MemberSummary> build() {
    return [];
  }

  void addFriends(List<MemberSummary> friends) {
    state = [...state, ...friends];
  }

  int getCurrentPageNum() {
    return state.length % FriendConstant.PAGE_SIZE;
  }
}
