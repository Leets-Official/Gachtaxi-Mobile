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

  void removeBlacklist(int receiverId) {
    state = state.where((element) => element.receiverId != receiverId).toList();
  }

  void clear() {
    state = [];
  }
}
