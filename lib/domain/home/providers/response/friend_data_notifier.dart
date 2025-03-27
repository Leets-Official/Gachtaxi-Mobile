import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/home/model/friend/friend_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_data_notifier.g.dart';

@riverpod
class FriendDataNotifier extends _$FriendDataNotifier {
  @override
  Future<FriendResponse> build() async {
    return FriendResponse(
        friends: [],
        pageable: Pageable(
            pageNumber: 0, pageSize: 0, numberOfElements: 0, isLast: false));
  }
}
