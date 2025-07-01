import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/blacklist/application/blacklist_constant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blacklist_list_pagination_state.g.dart';

@Riverpod(keepAlive: true)
class BlacklistListPaginationState extends _$BlacklistListPaginationState {
  @override
  Pageable build() {
    return Pageable(
      pageNumber: 0,
      pageSize: BlacklistConstant.PAGE_SIZE,
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

  void clear() {
    state = Pageable(
      pageNumber: 0,
      pageSize: BlacklistConstant.PAGE_SIZE,
      numberOfElements: -1,
      isLast: false,
    );
  }
}
