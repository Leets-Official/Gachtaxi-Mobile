import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/enums/gender_model.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/friend/data/models/friend_model.dart';
import 'package:gachtaxi_app/domain/friend/data/models/member_summary.dart';
import 'package:gachtaxi_app/domain/friend/data/models/response/friend_list_response.dart';
import 'package:gachtaxi_app/domain/friend/data/models/response/friend_search_response.dart';
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
      return FriendListResponse(
          response: [
            Friend(
              friendsId: 1,
              friendsNickName: '김주영',
              friendsProfileUrl: '',
              gender: Gender.MALE,
              chatRoomId: 1,
            ),
            Friend(
              friendsId: 2,
              friendsNickName: '이지훈',
              friendsProfileUrl:
                  'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
              gender: Gender.MALE,
              chatRoomId: 1,
            ),
            Friend(
              friendsId: 3,
              friendsNickName: '이지훈',
              friendsProfileUrl:
                  'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
              gender: Gender.MALE,
              chatRoomId: 1,
            ),
            Friend(
              friendsId: 4,
              friendsNickName: '이지훈',
              friendsProfileUrl:
                  'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
              gender: Gender.MALE,
              chatRoomId: 1,
            ),
            Friend(
              friendsId: 5,
              friendsNickName: '이지훈',
              friendsProfileUrl:
                  'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
              gender: Gender.MALE,
              chatRoomId: 1,
            ),
            Friend(
              friendsId: 6,
              friendsNickName: '이지훈',
              friendsProfileUrl:
                  'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
              gender: Gender.MALE,
              chatRoomId: 1,
            ),
            Friend(
              friendsId: 7,
              friendsNickName: '이지훈',
              friendsProfileUrl:
                  'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
              gender: Gender.MALE,
              chatRoomId: 1,
            ),
            Friend(
              friendsId: 8,
              friendsNickName: '이지훈',
              friendsProfileUrl:
                  'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
              gender: Gender.MALE,
              chatRoomId: 1,
            ),
          ],
          pageable: Pageable(
              pageNumber: 0, pageSize: 20, numberOfElements: 8, isLast: true));
      // rethrow;
    }
  }

  Future<FriendSearchResponse> searchFriends(
      String nickname, int pageNum, int pageSize) async {
    try {
      String query = "?nickname=$nickname&pageNum=$pageNum&pageSize=$pageSize";
      final response = await ApiClient.get(Uri.parse(FRIEND_PATH + query));
      return FriendSearchResponse.fromJson(response.data);
    } catch (e) {
      return FriendSearchResponse(
          memberList: [
            MemberSummary(
              userId: 1,
              nickname: '김주영',
              profilePicture: '',
              gender: Gender.MALE,
            ),
            MemberSummary(
              userId: 2,
              nickname: '이지훈',
              profilePicture: '',
              gender: Gender.MALE,
            ),
          ],
          pageable: Pageable(
              pageNumber: 0, pageSize: 20, numberOfElements: 2, isLast: true));
      // rethrow;
    }
  }

  Future<void> requestFriend(String nickname) async {
    try {
      await ApiClient.post(Uri.parse(FRIEND_PATH), body: {
        "nickname": nickname,
      });
    } catch (e) {
      // rethrow;
    }
  }
}
