// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticesDataImpl _$$NoticesDataImplFromJson(Map<String, dynamic> json) =>
    _$NoticesDataImpl(
      notices: (json['notices'] as List<dynamic>)
          .map((e) => Notice.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NoticesDataImplToJson(_$NoticesDataImpl instance) =>
    <String, dynamic>{
      'notices': instance.notices,
      'pageable': instance.pageable,
    };

_$NoticeImpl _$$NoticeImplFromJson(Map<String, dynamic> json) => _$NoticeImpl(
      noticeId: (json['noticeId'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      createDate: json['createDate'] as String,
    );

Map<String, dynamic> _$$NoticeImplToJson(_$NoticeImpl instance) =>
    <String, dynamic>{
      'noticeId': instance.noticeId,
      'title': instance.title,
      'content': instance.content,
      'createDate': instance.createDate,
    };
