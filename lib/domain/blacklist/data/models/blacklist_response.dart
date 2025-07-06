import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/blacklist/data/models/blacklist_model.dart';

part 'blacklist_response.freezed.dart';
part 'blacklist_response.g.dart';

@freezed
class BlacklistResponse with _$BlacklistResponse {
  const factory BlacklistResponse({
    required List<Blacklist> blacklist,
    required Pageable pageable,
  }) = _BlacklistResponse;

  factory BlacklistResponse.fromJson(Map<String, dynamic> json) =>
      _$BlacklistResponseFromJson(json);
}
