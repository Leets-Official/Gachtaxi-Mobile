import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/friend/data/models/response/friend_list_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_repository.g.dart';

@Riverpod(keepAlive: true)
FriendRepository friendRepository(Ref ref) => FriendRepository();

class FriendRepository {
  static const String FRIEND_PATH = "/api/friends";

  Future<FriendListResponse> getFriends(int pageNum, int pageSize) async {
    try {
      String query = "?pageNum=$pageNum&pageSize=$pageSize";
      final response = await ApiClient.get(Uri.parse(FRIEND_PATH + query));

      return FriendListResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
