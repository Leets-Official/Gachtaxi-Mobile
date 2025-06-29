import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_matching_request_model.freezed.dart';
part 'auto_matching_request_model.g.dart';

@freezed
class AutoMatchingRequest with _$AutoMatchingRequest {
  const factory AutoMatchingRequest({
    required String startPoint,
    required String destinationPoint,
    String? startName,
    String? destinationName,
    List<String>? criteria,
    List<String>? members,
    int? expectedTotalCharge,
    String? departure,
    String? destination,
  }) = _AutoMatchingRequest;

  factory AutoMatchingRequest.fromJson(Map<String, dynamic> json) =>
      _$AutoMatchingRequestFromJson(json);
}
