// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_matching_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchingDataImpl _$$MatchingDataImplFromJson(Map<String, dynamic> json) =>
    _$MatchingDataImpl(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => MatchingRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MatchingDataImplToJson(_$MatchingDataImpl instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
      'pageable': instance.pageable,
    };
