import 'package:gachtaxi_app/domain/blacklist/application/blacklist_constant.dart';
import 'package:gachtaxi_app/domain/blacklist/data/models/blacklist_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blacklists_list_state.g.dart';

@Riverpod(keepAlive: true)
class BlacklistsListState extends _$BlacklistsListState {
  @override
  List<Blacklist> build() {
    return [];
  }

  void addBlacklist(Blacklist blacklist) {
    state = [...state, blacklist];
  }

  void addAllBlacklist(List<Blacklist> blacklist) {
    state = [...state, ...blacklist];
  }

  void removeBlacklist(Blacklist blacklist) {
    state = state
        .where((element) => element.receiverId != blacklist.receiverId)
        .toList();
  }

  int getCurrentPageNum() {
    return state.length % BlacklistConstant.PAGE_SIZE;
  }
}
