import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/friend/application/friend_constant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_list_pagination_state.g.dart';

@Riverpod(keepAlive: true)
class FriendListPaginationState extends _$FriendListPaginationState {
  @override
  Pageable build() {
    return Pageable(
      pageNumber: 0,
      pageSize: FriendConstant.PAGE_SIZE,
      numberOfElements: -1,
      isLast: false,
    );
  }

  int getCurrentPageNum() {
    return state.pageNumber;
  }

  void setPageable(Pageable pageable) {
    state = pageable;
  }
}
