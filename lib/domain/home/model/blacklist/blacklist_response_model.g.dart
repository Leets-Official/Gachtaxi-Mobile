// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blacklist_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlacklistResponseImpl _$$BlacklistResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BlacklistResponseImpl(
      blacklist: (json['blacklist'] as List<dynamic>)
          .map((e) => Blacklist.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BlacklistResponseImplToJson(
        _$BlacklistResponseImpl instance) =>
    <String, dynamic>{
      'blacklist': instance.blacklist,
      'pageable': instance.pageable,
    };
