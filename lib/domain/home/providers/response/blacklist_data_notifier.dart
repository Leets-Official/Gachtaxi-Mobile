import 'package:gachtaxi_app/common/enums/gender_model.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/home/model/blacklist/blacklist_model.dart';
import 'package:gachtaxi_app/domain/home/model/blacklist/blacklist_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blacklist_data_notifier.g.dart';

@riverpod
class BlacklistDataNotifier extends _$BlacklistDataNotifier {
  @override
  BlacklistResponse build() {
    return BlacklistResponse(
        blacklist: [
          Blacklist(
            receiverId: 1,
            receiverNickname: '이지훈',
            gender: Gender.MALE,
            receiverProfilePicture:
                'https://avatars.githubusercontent.com/u/163561527?s=400&u=c5f25ee3bf9162818aad262703e7d406dc548e8b&v=4',
          ),
        ],
        pageable: Pageable(
            pageNumber: 0, pageSize: 0, numberOfElements: 0, isLast: false));
  }
}
