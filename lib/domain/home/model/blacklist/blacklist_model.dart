import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/enums/gender_model.dart';

part 'blacklist_model.freezed.dart';
part 'blacklist_model.g.dart';

@freezed
abstract class Blacklist with _$Blacklist {
  const factory Blacklist({
    required int receiverId,
    required String receiverNickname,
    required String receiverProfilePicture,
    required Gender gender,
  }) = _Blacklist;

  factory Blacklist.fromJson(Map<String, dynamic> json) =>
      _$BlacklistFromJson(json);
}
