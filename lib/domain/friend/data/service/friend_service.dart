import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/friend/application/friend_constant.dart';
import 'package:gachtaxi_app/domain/friend/data/models/friend_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gachtaxi_app/domain/friend/data/repository/friend_repository.dart';

part 'friend_service.g.dart';

@Riverpod(keepAlive: true)
FriendService friendService(Ref ref) =>
    FriendService(ref.read(friendRepositoryProvider));

class FriendService {
  final FriendRepository _friendRepository;
  FriendService(this._friendRepository);

  Future<List<Friend>> getFriends(int pageNum) async {
    final response =
        await _friendRepository.getFriends(pageNum, FriendConstant.PAGE_SIZE);
    return response.response;
  }
}
