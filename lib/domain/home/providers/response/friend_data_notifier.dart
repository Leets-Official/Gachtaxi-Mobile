import 'package:gachtaxi_app/common/enums/gender_model.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/home/model/friend/friend_model.dart';
import 'package:gachtaxi_app/domain/home/model/friend/friend_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_data_notifier.g.dart';

@riverpod
class FriendDataNotifier extends _$FriendDataNotifier {
  @override
  FriendResponse build() {
    return FriendResponse(
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
            friendsId: 3,
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
            friendsId: 3,
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
            friendsId: 3,
            friendsNickName: '이지훈',
            friendsProfileUrl:
                'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
            gender: Gender.MALE,
            chatRoomId: 1,
          ),
        ],
        pageable: Pageable(
            pageNumber: 0, pageSize: 0, numberOfElements: 0, isLast: false));
  }
}
