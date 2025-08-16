import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/home/model/friend/friend_model.dart';

part 'friend_response_model.freezed.dart';
part 'friend_response_model.g.dart';

@freezed
abstract class FriendResponse with _$FriendResponse {
  const factory FriendResponse({
    required List<Friend> response,
    required Pageable pageable,
  }) = _FriendResponse;

  factory FriendResponse.fromJson(Map<String, dynamic> json) =>
      _$FriendResponseFromJson(json);
}
