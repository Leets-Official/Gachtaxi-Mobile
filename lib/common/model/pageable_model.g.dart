// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageableImpl _$$PageableImplFromJson(Map<String, dynamic> json) =>
    _$PageableImpl(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      numberOfElements: (json['numberOfElements'] as num).toInt(),
      isLast: json['isLast'] as bool,
    );

Map<String, dynamic> _$$PageableImplToJson(_$PageableImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'numberOfElements': instance.numberOfElements,
      'isLast': instance.isLast,
    };
