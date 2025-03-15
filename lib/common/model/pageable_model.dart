import 'package:freezed_annotation/freezed_annotation.dart';

part 'pageable_model.g.dart';
part 'pageable_model.freezed.dart';

@freezed
class Pageable with _$Pageable {
  const factory Pageable({
    required int pageNumber,
    required int pageSize,
    required int numberOfElements,
    required bool isLast,
  }) = _Pageable;

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);
}
