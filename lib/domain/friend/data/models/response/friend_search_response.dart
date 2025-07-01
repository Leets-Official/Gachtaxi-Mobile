import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/friend/data/models/member_summary.dart';

part 'friend_search_response.freezed.dart';
part 'friend_search_response.g.dart';

@freezed
class FriendSearchResponse with _$FriendSearchResponse {
  const factory FriendSearchResponse({
    required List<MemberSummary> memberList,
    required Pageable pageable,
  }) = _FriendSearchResponse;

  factory FriendSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$FriendSearchResponseFromJson(json);
}
