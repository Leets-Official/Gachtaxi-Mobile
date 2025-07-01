import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/friend/data/models/friend_model.dart';

part 'friend_list_response.freezed.dart';
part 'friend_list_response.g.dart';

@freezed
class FriendListResponse with _$FriendListResponse {
  const factory FriendListResponse({
    required List<Friend> response,
    required Pageable pageable,
  }) = _FriendListResponse;

  factory FriendListResponse.fromJson(Map<String, dynamic> json) =>
      _$FriendListResponseFromJson(json);
}
