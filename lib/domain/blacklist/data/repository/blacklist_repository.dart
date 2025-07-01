import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/enums/gender_model.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/blacklist/application/blacklist_constant.dart';
import 'package:gachtaxi_app/domain/blacklist/data/models/blacklist_model.dart';

import 'package:gachtaxi_app/domain/blacklist/data/models/blacklist_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blacklist_repository.g.dart';

@Riverpod(keepAlive: true)
BlacklistRepository blacklistRepository(Ref ref) => BlacklistRepository();

class BlacklistRepository {
  static const String BLACKLIST_PATH = '/api/blacklists';

  Future<BlacklistResponse> getBlacklists(int pageNum) async {
    String query = '?pageNum=$pageNum&pageSize=${BlacklistConstant.PAGE_SIZE}';
    try {
      final response = await ApiClient.get(Uri.parse(BLACKLIST_PATH + query));
      return BlacklistResponse.fromJson(response.data);
    } catch (e) {
      return BlacklistResponse(
        blacklist: [
          Blacklist(
            receiverId: 1,
            receiverNickname: '이지훈',
            gender: Gender.MALE,
            receiverProfilePicture:
                'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
          ),
          Blacklist(
            receiverId: 1,
            receiverNickname: '이지훈',
            gender: Gender.MALE,
            receiverProfilePicture:
                'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
          ),
          Blacklist(
            receiverId: 1,
            receiverNickname: '이지훈',
            gender: Gender.MALE,
            receiverProfilePicture:
                'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
          ),
          Blacklist(
            receiverId: 1,
            receiverNickname: '이지훈',
            gender: Gender.MALE,
            receiverProfilePicture:
                'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
          ),
          Blacklist(
            receiverId: 1,
            receiverNickname: '이지훈',
            gender: Gender.MALE,
            receiverProfilePicture:
                'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
          ),
        ],
        pageable: Pageable(
          pageNumber: 0,
          pageSize: 20,
          numberOfElements: 5,
          isLast: true,
        ),
      );
      // rethrow;
    }
  }
}
