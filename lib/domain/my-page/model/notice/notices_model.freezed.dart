// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notices_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoticesData _$NoticesDataFromJson(Map<String, dynamic> json) {
  return _NoticesData.fromJson(json);
}

/// @nodoc
mixin _$NoticesData {
  List<Notice> get notices => throw _privateConstructorUsedError;
  Pageable get pageable => throw _privateConstructorUsedError;

  /// Serializes this NoticesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoticesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoticesDataCopyWith<NoticesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticesDataCopyWith<$Res> {
  factory $NoticesDataCopyWith(
          NoticesData value, $Res Function(NoticesData) then) =
      _$NoticesDataCopyWithImpl<$Res, NoticesData>;
  @useResult
  $Res call({List<Notice> notices, Pageable pageable});

  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class _$NoticesDataCopyWithImpl<$Res, $Val extends NoticesData>
    implements $NoticesDataCopyWith<$Res> {
  _$NoticesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoticesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notices = null,
    Object? pageable = null,
  }) {
    return _then(_value.copyWith(
      notices: null == notices
          ? _value.notices
          : notices // ignore: cast_nullable_to_non_nullable
              as List<Notice>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ) as $Val);
  }

  /// Create a copy of NoticesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageableCopyWith<$Res> get pageable {
    return $PageableCopyWith<$Res>(_value.pageable, (value) {
      return _then(_value.copyWith(pageable: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NoticesDataImplCopyWith<$Res>
    implements $NoticesDataCopyWith<$Res> {
  factory _$$NoticesDataImplCopyWith(
          _$NoticesDataImpl value, $Res Function(_$NoticesDataImpl) then) =
      __$$NoticesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Notice> notices, Pageable pageable});

  @override
  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class __$$NoticesDataImplCopyWithImpl<$Res>
    extends _$NoticesDataCopyWithImpl<$Res, _$NoticesDataImpl>
    implements _$$NoticesDataImplCopyWith<$Res> {
  __$$NoticesDataImplCopyWithImpl(
      _$NoticesDataImpl _value, $Res Function(_$NoticesDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoticesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notices = null,
    Object? pageable = null,
  }) {
    return _then(_$NoticesDataImpl(
      notices: null == notices
          ? _value._notices
          : notices // ignore: cast_nullable_to_non_nullable
              as List<Notice>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticesDataImpl implements _NoticesData {
  const _$NoticesDataImpl(
      {required final List<Notice> notices, required this.pageable})
      : _notices = notices;

  factory _$NoticesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticesDataImplFromJson(json);

  final List<Notice> _notices;
  @override
  List<Notice> get notices {
    if (_notices is EqualUnmodifiableListView) return _notices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notices);
  }

  @override
  final Pageable pageable;

  @override
  String toString() {
    return 'NoticesData(notices: $notices, pageable: $pageable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticesDataImpl &&
            const DeepCollectionEquality().equals(other._notices, _notices) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notices), pageable);

  /// Create a copy of NoticesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticesDataImplCopyWith<_$NoticesDataImpl> get copyWith =>
      __$$NoticesDataImplCopyWithImpl<_$NoticesDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticesDataImplToJson(
      this,
    );
  }
}

abstract class _NoticesData implements NoticesData {
  const factory _NoticesData(
      {required final List<Notice> notices,
      required final Pageable pageable}) = _$NoticesDataImpl;

  factory _NoticesData.fromJson(Map<String, dynamic> json) =
      _$NoticesDataImpl.fromJson;

  @override
  List<Notice> get notices;
  @override
  Pageable get pageable;

  /// Create a copy of NoticesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoticesDataImplCopyWith<_$NoticesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Notice _$NoticeFromJson(Map<String, dynamic> json) {
  return _Notice.fromJson(json);
}

/// @nodoc
mixin _$Notice {
  int get noticeId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get createDate => throw _privateConstructorUsedError;

  /// Serializes this Notice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoticeCopyWith<Notice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeCopyWith<$Res> {
  factory $NoticeCopyWith(Notice value, $Res Function(Notice) then) =
      _$NoticeCopyWithImpl<$Res, Notice>;
  @useResult
  $Res call({int noticeId, String title, String content, String createDate});
}

/// @nodoc
class _$NoticeCopyWithImpl<$Res, $Val extends Notice>
    implements $NoticeCopyWith<$Res> {
  _$NoticeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noticeId = null,
    Object? title = null,
    Object? content = null,
    Object? createDate = null,
  }) {
    return _then(_value.copyWith(
      noticeId: null == noticeId
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeImplCopyWith<$Res> implements $NoticeCopyWith<$Res> {
  factory _$$NoticeImplCopyWith(
          _$NoticeImpl value, $Res Function(_$NoticeImpl) then) =
      __$$NoticeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int noticeId, String title, String content, String createDate});
}

/// @nodoc
class __$$NoticeImplCopyWithImpl<$Res>
    extends _$NoticeCopyWithImpl<$Res, _$NoticeImpl>
    implements _$$NoticeImplCopyWith<$Res> {
  __$$NoticeImplCopyWithImpl(
      _$NoticeImpl _value, $Res Function(_$NoticeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noticeId = null,
    Object? title = null,
    Object? content = null,
    Object? createDate = null,
  }) {
    return _then(_$NoticeImpl(
      noticeId: null == noticeId
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeImpl implements _Notice {
  const _$NoticeImpl(
      {required this.noticeId,
      required this.title,
      required this.content,
      required this.createDate});

  factory _$NoticeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeImplFromJson(json);

  @override
  final int noticeId;
  @override
  final String title;
  @override
  final String content;
  @override
  final String createDate;

  @override
  String toString() {
    return 'Notice(noticeId: $noticeId, title: $title, content: $content, createDate: $createDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeImpl &&
            (identical(other.noticeId, noticeId) ||
                other.noticeId == noticeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, noticeId, title, content, createDate);

  /// Create a copy of Notice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeImplCopyWith<_$NoticeImpl> get copyWith =>
      __$$NoticeImplCopyWithImpl<_$NoticeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeImplToJson(
      this,
    );
  }
}

abstract class _Notice implements Notice {
  const factory _Notice(
      {required final int noticeId,
      required final String title,
      required final String content,
      required final String createDate}) = _$NoticeImpl;

  factory _Notice.fromJson(Map<String, dynamic> json) = _$NoticeImpl.fromJson;

  @override
  int get noticeId;
  @override
  String get title;
  @override
  String get content;
  @override
  String get createDate;

  /// Create a copy of Notice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoticeImplCopyWith<_$NoticeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
