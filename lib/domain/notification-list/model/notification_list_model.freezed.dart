// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationListData _$NotificationListDataFromJson(Map<String, dynamic> json) {
  return _NotificationListData.fromJson(json);
}

/// @nodoc
mixin _$NotificationListData {
  List<NotificationModel> get response => throw _privateConstructorUsedError;
  Pageable get pageable => throw _privateConstructorUsedError;

  /// Serializes this NotificationListData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationListDataCopyWith<NotificationListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationListDataCopyWith<$Res> {
  factory $NotificationListDataCopyWith(NotificationListData value,
          $Res Function(NotificationListData) then) =
      _$NotificationListDataCopyWithImpl<$Res, NotificationListData>;
  @useResult
  $Res call({List<NotificationModel> response, Pageable pageable});

  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class _$NotificationListDataCopyWithImpl<$Res,
        $Val extends NotificationListData>
    implements $NotificationListDataCopyWith<$Res> {
  _$NotificationListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationListData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? pageable = null,
  }) {
    return _then(_value.copyWith(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ) as $Val);
  }

  /// Create a copy of NotificationListData
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
abstract class _$$NotificationListDataImplCopyWith<$Res>
    implements $NotificationListDataCopyWith<$Res> {
  factory _$$NotificationListDataImplCopyWith(_$NotificationListDataImpl value,
          $Res Function(_$NotificationListDataImpl) then) =
      __$$NotificationListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NotificationModel> response, Pageable pageable});

  @override
  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class __$$NotificationListDataImplCopyWithImpl<$Res>
    extends _$NotificationListDataCopyWithImpl<$Res, _$NotificationListDataImpl>
    implements _$$NotificationListDataImplCopyWith<$Res> {
  __$$NotificationListDataImplCopyWithImpl(_$NotificationListDataImpl _value,
      $Res Function(_$NotificationListDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationListData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? pageable = null,
  }) {
    return _then(_$NotificationListDataImpl(
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationListDataImpl implements _NotificationListData {
  const _$NotificationListDataImpl(
      {required final List<NotificationModel> response, required this.pageable})
      : _response = response;

  factory _$NotificationListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationListDataImplFromJson(json);

  final List<NotificationModel> _response;
  @override
  List<NotificationModel> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  final Pageable pageable;

  @override
  String toString() {
    return 'NotificationListData(response: $response, pageable: $pageable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationListDataImpl &&
            const DeepCollectionEquality().equals(other._response, _response) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_response), pageable);

  /// Create a copy of NotificationListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationListDataImplCopyWith<_$NotificationListDataImpl>
      get copyWith =>
          __$$NotificationListDataImplCopyWithImpl<_$NotificationListDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationListDataImplToJson(
      this,
    );
  }
}

abstract class _NotificationListData implements NotificationListData {
  const factory _NotificationListData(
      {required final List<NotificationModel> response,
      required final Pageable pageable}) = _$NotificationListDataImpl;

  factory _NotificationListData.fromJson(Map<String, dynamic> json) =
      _$NotificationListDataImpl.fromJson;

  @override
  List<NotificationModel> get response;
  @override
  Pageable get pageable;

  /// Create a copy of NotificationListData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationListDataImplCopyWith<_$NotificationListDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'matchStart':
      return MatchStartNotification.fromJson(json);
    case 'matchFinished':
      return MatchFinishedNotification.fromJson(json);
    case 'friendRequest':
      return FriendRequestNotification.fromJson(json);
    case 'matchInvite':
      return MatchInviteNotification.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'NotificationModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$NotificationModel {
  String get notificationId => throw _privateConstructorUsedError;
  int get receiverId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  Object get payload => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String notificationId, int receiverId,
            String content, MatchPayload payload, String createdAt, String type)
        matchStart,
    required TResult Function(String notificationId, int receiverId,
            String content, MatchPayload payload, String createdAt, String type)
        matchFinished,
    required TResult Function(
            String notificationId,
            int receiverId,
            String content,
            FriendRequestPayload payload,
            String createdAt,
            String type)
        friendRequest,
    required TResult Function(
            String notificationId,
            int receiverId,
            String content,
            MatchingRequestPayload payload,
            String createdAt,
            String type)
        matchInvite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchStart,
    TResult? Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchFinished,
    TResult? Function(String notificationId, int receiverId, String content,
            FriendRequestPayload payload, String createdAt, String type)?
        friendRequest,
    TResult? Function(String notificationId, int receiverId, String content,
            MatchingRequestPayload payload, String createdAt, String type)?
        matchInvite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchStart,
    TResult Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchFinished,
    TResult Function(String notificationId, int receiverId, String content,
            FriendRequestPayload payload, String createdAt, String type)?
        friendRequest,
    TResult Function(String notificationId, int receiverId, String content,
            MatchingRequestPayload payload, String createdAt, String type)?
        matchInvite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchStartNotification value) matchStart,
    required TResult Function(MatchFinishedNotification value) matchFinished,
    required TResult Function(FriendRequestNotification value) friendRequest,
    required TResult Function(MatchInviteNotification value) matchInvite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchStartNotification value)? matchStart,
    TResult? Function(MatchFinishedNotification value)? matchFinished,
    TResult? Function(FriendRequestNotification value)? friendRequest,
    TResult? Function(MatchInviteNotification value)? matchInvite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchStartNotification value)? matchStart,
    TResult Function(MatchFinishedNotification value)? matchFinished,
    TResult Function(FriendRequestNotification value)? friendRequest,
    TResult Function(MatchInviteNotification value)? matchInvite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {String notificationId,
      int receiverId,
      String content,
      String createdAt,
      String type});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? receiverId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchStartNotificationImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$MatchStartNotificationImplCopyWith(
          _$MatchStartNotificationImpl value,
          $Res Function(_$MatchStartNotificationImpl) then) =
      __$$MatchStartNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      int receiverId,
      String content,
      MatchPayload payload,
      String createdAt,
      String type});

  $MatchPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$MatchStartNotificationImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$MatchStartNotificationImpl>
    implements _$$MatchStartNotificationImplCopyWith<$Res> {
  __$$MatchStartNotificationImplCopyWithImpl(
      _$MatchStartNotificationImpl _value,
      $Res Function(_$MatchStartNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? receiverId = null,
    Object? content = null,
    Object? payload = null,
    Object? createdAt = null,
    Object? type = null,
  }) {
    return _then(_$MatchStartNotificationImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as MatchPayload,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchPayloadCopyWith<$Res> get payload {
    return $MatchPayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchStartNotificationImpl implements MatchStartNotification {
  const _$MatchStartNotificationImpl(
      {required this.notificationId,
      required this.receiverId,
      required this.content,
      required this.payload,
      required this.createdAt,
      this.type = 'MATCH_START',
      final String? $type})
      : $type = $type ?? 'matchStart';

  factory _$MatchStartNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchStartNotificationImplFromJson(json);

  @override
  final String notificationId;
  @override
  final int receiverId;
  @override
  final String content;
  @override
  final MatchPayload payload;
  @override
  final String createdAt;
  @override
  @JsonKey()
  final String type;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationModel.matchStart(notificationId: $notificationId, receiverId: $receiverId, content: $content, payload: $payload, createdAt: $createdAt, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchStartNotificationImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notificationId, receiverId,
      content, payload, createdAt, type);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchStartNotificationImplCopyWith<_$MatchStartNotificationImpl>
      get copyWith => __$$MatchStartNotificationImplCopyWithImpl<
          _$MatchStartNotificationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String notificationId, int receiverId,
            String content, MatchPayload payload, String createdAt, String type)
        matchStart,
    required TResult Function(String notificationId, int receiverId,
            String content, MatchPayload payload, String createdAt, String type)
        matchFinished,
    required TResult Function(
            String notificationId,
            int receiverId,
            String content,
            FriendRequestPayload payload,
            String createdAt,
            String type)
        friendRequest,
    required TResult Function(
            String notificationId,
            int receiverId,
            String content,
            MatchingRequestPayload payload,
            String createdAt,
            String type)
        matchInvite,
  }) {
    return matchStart(
        notificationId, receiverId, content, payload, createdAt, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchStart,
    TResult? Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchFinished,
    TResult? Function(String notificationId, int receiverId, String content,
            FriendRequestPayload payload, String createdAt, String type)?
        friendRequest,
    TResult? Function(String notificationId, int receiverId, String content,
            MatchingRequestPayload payload, String createdAt, String type)?
        matchInvite,
  }) {
    return matchStart?.call(
        notificationId, receiverId, content, payload, createdAt, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchStart,
    TResult Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchFinished,
    TResult Function(String notificationId, int receiverId, String content,
            FriendRequestPayload payload, String createdAt, String type)?
        friendRequest,
    TResult Function(String notificationId, int receiverId, String content,
            MatchingRequestPayload payload, String createdAt, String type)?
        matchInvite,
    required TResult orElse(),
  }) {
    if (matchStart != null) {
      return matchStart(
          notificationId, receiverId, content, payload, createdAt, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchStartNotification value) matchStart,
    required TResult Function(MatchFinishedNotification value) matchFinished,
    required TResult Function(FriendRequestNotification value) friendRequest,
    required TResult Function(MatchInviteNotification value) matchInvite,
  }) {
    return matchStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchStartNotification value)? matchStart,
    TResult? Function(MatchFinishedNotification value)? matchFinished,
    TResult? Function(FriendRequestNotification value)? friendRequest,
    TResult? Function(MatchInviteNotification value)? matchInvite,
  }) {
    return matchStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchStartNotification value)? matchStart,
    TResult Function(MatchFinishedNotification value)? matchFinished,
    TResult Function(FriendRequestNotification value)? friendRequest,
    TResult Function(MatchInviteNotification value)? matchInvite,
    required TResult orElse(),
  }) {
    if (matchStart != null) {
      return matchStart(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchStartNotificationImplToJson(
      this,
    );
  }
}

abstract class MatchStartNotification implements NotificationModel {
  const factory MatchStartNotification(
      {required final String notificationId,
      required final int receiverId,
      required final String content,
      required final MatchPayload payload,
      required final String createdAt,
      final String type}) = _$MatchStartNotificationImpl;

  factory MatchStartNotification.fromJson(Map<String, dynamic> json) =
      _$MatchStartNotificationImpl.fromJson;

  @override
  String get notificationId;
  @override
  int get receiverId;
  @override
  String get content;
  @override
  MatchPayload get payload;
  @override
  String get createdAt;
  @override
  String get type;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchStartNotificationImplCopyWith<_$MatchStartNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchFinishedNotificationImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$MatchFinishedNotificationImplCopyWith(
          _$MatchFinishedNotificationImpl value,
          $Res Function(_$MatchFinishedNotificationImpl) then) =
      __$$MatchFinishedNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      int receiverId,
      String content,
      MatchPayload payload,
      String createdAt,
      String type});

  $MatchPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$MatchFinishedNotificationImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res,
        _$MatchFinishedNotificationImpl>
    implements _$$MatchFinishedNotificationImplCopyWith<$Res> {
  __$$MatchFinishedNotificationImplCopyWithImpl(
      _$MatchFinishedNotificationImpl _value,
      $Res Function(_$MatchFinishedNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? receiverId = null,
    Object? content = null,
    Object? payload = null,
    Object? createdAt = null,
    Object? type = null,
  }) {
    return _then(_$MatchFinishedNotificationImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as MatchPayload,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchPayloadCopyWith<$Res> get payload {
    return $MatchPayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchFinishedNotificationImpl implements MatchFinishedNotification {
  const _$MatchFinishedNotificationImpl(
      {required this.notificationId,
      required this.receiverId,
      required this.content,
      required this.payload,
      required this.createdAt,
      this.type = 'MATCH_FINISHED',
      final String? $type})
      : $type = $type ?? 'matchFinished';

  factory _$MatchFinishedNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchFinishedNotificationImplFromJson(json);

  @override
  final String notificationId;
  @override
  final int receiverId;
  @override
  final String content;
  @override
  final MatchPayload payload;
  @override
  final String createdAt;
  @override
  @JsonKey()
  final String type;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationModel.matchFinished(notificationId: $notificationId, receiverId: $receiverId, content: $content, payload: $payload, createdAt: $createdAt, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchFinishedNotificationImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notificationId, receiverId,
      content, payload, createdAt, type);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchFinishedNotificationImplCopyWith<_$MatchFinishedNotificationImpl>
      get copyWith => __$$MatchFinishedNotificationImplCopyWithImpl<
          _$MatchFinishedNotificationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String notificationId, int receiverId,
            String content, MatchPayload payload, String createdAt, String type)
        matchStart,
    required TResult Function(String notificationId, int receiverId,
            String content, MatchPayload payload, String createdAt, String type)
        matchFinished,
    required TResult Function(
            String notificationId,
            int receiverId,
            String content,
            FriendRequestPayload payload,
            String createdAt,
            String type)
        friendRequest,
    required TResult Function(
            String notificationId,
            int receiverId,
            String content,
            MatchingRequestPayload payload,
            String createdAt,
            String type)
        matchInvite,
  }) {
    return matchFinished(
        notificationId, receiverId, content, payload, createdAt, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchStart,
    TResult? Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchFinished,
    TResult? Function(String notificationId, int receiverId, String content,
            FriendRequestPayload payload, String createdAt, String type)?
        friendRequest,
    TResult? Function(String notificationId, int receiverId, String content,
            MatchingRequestPayload payload, String createdAt, String type)?
        matchInvite,
  }) {
    return matchFinished?.call(
        notificationId, receiverId, content, payload, createdAt, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchStart,
    TResult Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchFinished,
    TResult Function(String notificationId, int receiverId, String content,
            FriendRequestPayload payload, String createdAt, String type)?
        friendRequest,
    TResult Function(String notificationId, int receiverId, String content,
            MatchingRequestPayload payload, String createdAt, String type)?
        matchInvite,
    required TResult orElse(),
  }) {
    if (matchFinished != null) {
      return matchFinished(
          notificationId, receiverId, content, payload, createdAt, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchStartNotification value) matchStart,
    required TResult Function(MatchFinishedNotification value) matchFinished,
    required TResult Function(FriendRequestNotification value) friendRequest,
    required TResult Function(MatchInviteNotification value) matchInvite,
  }) {
    return matchFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchStartNotification value)? matchStart,
    TResult? Function(MatchFinishedNotification value)? matchFinished,
    TResult? Function(FriendRequestNotification value)? friendRequest,
    TResult? Function(MatchInviteNotification value)? matchInvite,
  }) {
    return matchFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchStartNotification value)? matchStart,
    TResult Function(MatchFinishedNotification value)? matchFinished,
    TResult Function(FriendRequestNotification value)? friendRequest,
    TResult Function(MatchInviteNotification value)? matchInvite,
    required TResult orElse(),
  }) {
    if (matchFinished != null) {
      return matchFinished(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchFinishedNotificationImplToJson(
      this,
    );
  }
}

abstract class MatchFinishedNotification implements NotificationModel {
  const factory MatchFinishedNotification(
      {required final String notificationId,
      required final int receiverId,
      required final String content,
      required final MatchPayload payload,
      required final String createdAt,
      final String type}) = _$MatchFinishedNotificationImpl;

  factory MatchFinishedNotification.fromJson(Map<String, dynamic> json) =
      _$MatchFinishedNotificationImpl.fromJson;

  @override
  String get notificationId;
  @override
  int get receiverId;
  @override
  String get content;
  @override
  MatchPayload get payload;
  @override
  String get createdAt;
  @override
  String get type;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchFinishedNotificationImplCopyWith<_$MatchFinishedNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FriendRequestNotificationImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$FriendRequestNotificationImplCopyWith(
          _$FriendRequestNotificationImpl value,
          $Res Function(_$FriendRequestNotificationImpl) then) =
      __$$FriendRequestNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      int receiverId,
      String content,
      FriendRequestPayload payload,
      String createdAt,
      String type});

  $FriendRequestPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$FriendRequestNotificationImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res,
        _$FriendRequestNotificationImpl>
    implements _$$FriendRequestNotificationImplCopyWith<$Res> {
  __$$FriendRequestNotificationImplCopyWithImpl(
      _$FriendRequestNotificationImpl _value,
      $Res Function(_$FriendRequestNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? receiverId = null,
    Object? content = null,
    Object? payload = null,
    Object? createdAt = null,
    Object? type = null,
  }) {
    return _then(_$FriendRequestNotificationImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as FriendRequestPayload,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FriendRequestPayloadCopyWith<$Res> get payload {
    return $FriendRequestPayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendRequestNotificationImpl implements FriendRequestNotification {
  const _$FriendRequestNotificationImpl(
      {required this.notificationId,
      required this.receiverId,
      required this.content,
      required this.payload,
      required this.createdAt,
      this.type = 'FRIEND_REQUEST',
      final String? $type})
      : $type = $type ?? 'friendRequest';

  factory _$FriendRequestNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendRequestNotificationImplFromJson(json);

  @override
  final String notificationId;
  @override
  final int receiverId;
  @override
  final String content;
  @override
  final FriendRequestPayload payload;
  @override
  final String createdAt;
  @override
  @JsonKey()
  final String type;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationModel.friendRequest(notificationId: $notificationId, receiverId: $receiverId, content: $content, payload: $payload, createdAt: $createdAt, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendRequestNotificationImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notificationId, receiverId,
      content, payload, createdAt, type);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendRequestNotificationImplCopyWith<_$FriendRequestNotificationImpl>
      get copyWith => __$$FriendRequestNotificationImplCopyWithImpl<
          _$FriendRequestNotificationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String notificationId, int receiverId,
            String content, MatchPayload payload, String createdAt, String type)
        matchStart,
    required TResult Function(String notificationId, int receiverId,
            String content, MatchPayload payload, String createdAt, String type)
        matchFinished,
    required TResult Function(
            String notificationId,
            int receiverId,
            String content,
            FriendRequestPayload payload,
            String createdAt,
            String type)
        friendRequest,
    required TResult Function(
            String notificationId,
            int receiverId,
            String content,
            MatchingRequestPayload payload,
            String createdAt,
            String type)
        matchInvite,
  }) {
    return friendRequest(
        notificationId, receiverId, content, payload, createdAt, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchStart,
    TResult? Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchFinished,
    TResult? Function(String notificationId, int receiverId, String content,
            FriendRequestPayload payload, String createdAt, String type)?
        friendRequest,
    TResult? Function(String notificationId, int receiverId, String content,
            MatchingRequestPayload payload, String createdAt, String type)?
        matchInvite,
  }) {
    return friendRequest?.call(
        notificationId, receiverId, content, payload, createdAt, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchStart,
    TResult Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchFinished,
    TResult Function(String notificationId, int receiverId, String content,
            FriendRequestPayload payload, String createdAt, String type)?
        friendRequest,
    TResult Function(String notificationId, int receiverId, String content,
            MatchingRequestPayload payload, String createdAt, String type)?
        matchInvite,
    required TResult orElse(),
  }) {
    if (friendRequest != null) {
      return friendRequest(
          notificationId, receiverId, content, payload, createdAt, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchStartNotification value) matchStart,
    required TResult Function(MatchFinishedNotification value) matchFinished,
    required TResult Function(FriendRequestNotification value) friendRequest,
    required TResult Function(MatchInviteNotification value) matchInvite,
  }) {
    return friendRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchStartNotification value)? matchStart,
    TResult? Function(MatchFinishedNotification value)? matchFinished,
    TResult? Function(FriendRequestNotification value)? friendRequest,
    TResult? Function(MatchInviteNotification value)? matchInvite,
  }) {
    return friendRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchStartNotification value)? matchStart,
    TResult Function(MatchFinishedNotification value)? matchFinished,
    TResult Function(FriendRequestNotification value)? friendRequest,
    TResult Function(MatchInviteNotification value)? matchInvite,
    required TResult orElse(),
  }) {
    if (friendRequest != null) {
      return friendRequest(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendRequestNotificationImplToJson(
      this,
    );
  }
}

abstract class FriendRequestNotification implements NotificationModel {
  const factory FriendRequestNotification(
      {required final String notificationId,
      required final int receiverId,
      required final String content,
      required final FriendRequestPayload payload,
      required final String createdAt,
      final String type}) = _$FriendRequestNotificationImpl;

  factory FriendRequestNotification.fromJson(Map<String, dynamic> json) =
      _$FriendRequestNotificationImpl.fromJson;

  @override
  String get notificationId;
  @override
  int get receiverId;
  @override
  String get content;
  @override
  FriendRequestPayload get payload;
  @override
  String get createdAt;
  @override
  String get type;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendRequestNotificationImplCopyWith<_$FriendRequestNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchInviteNotificationImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$MatchInviteNotificationImplCopyWith(
          _$MatchInviteNotificationImpl value,
          $Res Function(_$MatchInviteNotificationImpl) then) =
      __$$MatchInviteNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      int receiverId,
      String content,
      MatchingRequestPayload payload,
      String createdAt,
      String type});

  $MatchingRequestPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$MatchInviteNotificationImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$MatchInviteNotificationImpl>
    implements _$$MatchInviteNotificationImplCopyWith<$Res> {
  __$$MatchInviteNotificationImplCopyWithImpl(
      _$MatchInviteNotificationImpl _value,
      $Res Function(_$MatchInviteNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? receiverId = null,
    Object? content = null,
    Object? payload = null,
    Object? createdAt = null,
    Object? type = null,
  }) {
    return _then(_$MatchInviteNotificationImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as MatchingRequestPayload,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchingRequestPayloadCopyWith<$Res> get payload {
    return $MatchingRequestPayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchInviteNotificationImpl implements MatchInviteNotification {
  const _$MatchInviteNotificationImpl(
      {required this.notificationId,
      required this.receiverId,
      required this.content,
      required this.payload,
      required this.createdAt,
      this.type = 'MATCH_INVITE',
      final String? $type})
      : $type = $type ?? 'matchInvite';

  factory _$MatchInviteNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchInviteNotificationImplFromJson(json);

  @override
  final String notificationId;
  @override
  final int receiverId;
  @override
  final String content;
  @override
  final MatchingRequestPayload payload;
  @override
  final String createdAt;
  @override
  @JsonKey()
  final String type;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationModel.matchInvite(notificationId: $notificationId, receiverId: $receiverId, content: $content, payload: $payload, createdAt: $createdAt, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchInviteNotificationImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notificationId, receiverId,
      content, payload, createdAt, type);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchInviteNotificationImplCopyWith<_$MatchInviteNotificationImpl>
      get copyWith => __$$MatchInviteNotificationImplCopyWithImpl<
          _$MatchInviteNotificationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String notificationId, int receiverId,
            String content, MatchPayload payload, String createdAt, String type)
        matchStart,
    required TResult Function(String notificationId, int receiverId,
            String content, MatchPayload payload, String createdAt, String type)
        matchFinished,
    required TResult Function(
            String notificationId,
            int receiverId,
            String content,
            FriendRequestPayload payload,
            String createdAt,
            String type)
        friendRequest,
    required TResult Function(
            String notificationId,
            int receiverId,
            String content,
            MatchingRequestPayload payload,
            String createdAt,
            String type)
        matchInvite,
  }) {
    return matchInvite(
        notificationId, receiverId, content, payload, createdAt, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchStart,
    TResult? Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchFinished,
    TResult? Function(String notificationId, int receiverId, String content,
            FriendRequestPayload payload, String createdAt, String type)?
        friendRequest,
    TResult? Function(String notificationId, int receiverId, String content,
            MatchingRequestPayload payload, String createdAt, String type)?
        matchInvite,
  }) {
    return matchInvite?.call(
        notificationId, receiverId, content, payload, createdAt, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchStart,
    TResult Function(String notificationId, int receiverId, String content,
            MatchPayload payload, String createdAt, String type)?
        matchFinished,
    TResult Function(String notificationId, int receiverId, String content,
            FriendRequestPayload payload, String createdAt, String type)?
        friendRequest,
    TResult Function(String notificationId, int receiverId, String content,
            MatchingRequestPayload payload, String createdAt, String type)?
        matchInvite,
    required TResult orElse(),
  }) {
    if (matchInvite != null) {
      return matchInvite(
          notificationId, receiverId, content, payload, createdAt, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchStartNotification value) matchStart,
    required TResult Function(MatchFinishedNotification value) matchFinished,
    required TResult Function(FriendRequestNotification value) friendRequest,
    required TResult Function(MatchInviteNotification value) matchInvite,
  }) {
    return matchInvite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchStartNotification value)? matchStart,
    TResult? Function(MatchFinishedNotification value)? matchFinished,
    TResult? Function(FriendRequestNotification value)? friendRequest,
    TResult? Function(MatchInviteNotification value)? matchInvite,
  }) {
    return matchInvite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchStartNotification value)? matchStart,
    TResult Function(MatchFinishedNotification value)? matchFinished,
    TResult Function(FriendRequestNotification value)? friendRequest,
    TResult Function(MatchInviteNotification value)? matchInvite,
    required TResult orElse(),
  }) {
    if (matchInvite != null) {
      return matchInvite(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchInviteNotificationImplToJson(
      this,
    );
  }
}

abstract class MatchInviteNotification implements NotificationModel {
  const factory MatchInviteNotification(
      {required final String notificationId,
      required final int receiverId,
      required final String content,
      required final MatchingRequestPayload payload,
      required final String createdAt,
      final String type}) = _$MatchInviteNotificationImpl;

  factory MatchInviteNotification.fromJson(Map<String, dynamic> json) =
      _$MatchInviteNotificationImpl.fromJson;

  @override
  String get notificationId;
  @override
  int get receiverId;
  @override
  String get content;
  @override
  MatchingRequestPayload get payload;
  @override
  String get createdAt;
  @override
  String get type;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchInviteNotificationImplCopyWith<_$MatchInviteNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MatchPayload _$MatchPayloadFromJson(Map<String, dynamic> json) {
  return _MatchPayload.fromJson(json);
}

/// @nodoc
mixin _$MatchPayload {
  String get startLocationName => throw _privateConstructorUsedError;
  String get endLocationName => throw _privateConstructorUsedError;

  /// Serializes this MatchPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchPayloadCopyWith<MatchPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchPayloadCopyWith<$Res> {
  factory $MatchPayloadCopyWith(
          MatchPayload value, $Res Function(MatchPayload) then) =
      _$MatchPayloadCopyWithImpl<$Res, MatchPayload>;
  @useResult
  $Res call({String startLocationName, String endLocationName});
}

/// @nodoc
class _$MatchPayloadCopyWithImpl<$Res, $Val extends MatchPayload>
    implements $MatchPayloadCopyWith<$Res> {
  _$MatchPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startLocationName = null,
    Object? endLocationName = null,
  }) {
    return _then(_value.copyWith(
      startLocationName: null == startLocationName
          ? _value.startLocationName
          : startLocationName // ignore: cast_nullable_to_non_nullable
              as String,
      endLocationName: null == endLocationName
          ? _value.endLocationName
          : endLocationName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchPayloadImplCopyWith<$Res>
    implements $MatchPayloadCopyWith<$Res> {
  factory _$$MatchPayloadImplCopyWith(
          _$MatchPayloadImpl value, $Res Function(_$MatchPayloadImpl) then) =
      __$$MatchPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String startLocationName, String endLocationName});
}

/// @nodoc
class __$$MatchPayloadImplCopyWithImpl<$Res>
    extends _$MatchPayloadCopyWithImpl<$Res, _$MatchPayloadImpl>
    implements _$$MatchPayloadImplCopyWith<$Res> {
  __$$MatchPayloadImplCopyWithImpl(
      _$MatchPayloadImpl _value, $Res Function(_$MatchPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startLocationName = null,
    Object? endLocationName = null,
  }) {
    return _then(_$MatchPayloadImpl(
      startLocationName: null == startLocationName
          ? _value.startLocationName
          : startLocationName // ignore: cast_nullable_to_non_nullable
              as String,
      endLocationName: null == endLocationName
          ? _value.endLocationName
          : endLocationName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchPayloadImpl implements _MatchPayload {
  const _$MatchPayloadImpl(
      {required this.startLocationName, required this.endLocationName});

  factory _$MatchPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchPayloadImplFromJson(json);

  @override
  final String startLocationName;
  @override
  final String endLocationName;

  @override
  String toString() {
    return 'MatchPayload(startLocationName: $startLocationName, endLocationName: $endLocationName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchPayloadImpl &&
            (identical(other.startLocationName, startLocationName) ||
                other.startLocationName == startLocationName) &&
            (identical(other.endLocationName, endLocationName) ||
                other.endLocationName == endLocationName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startLocationName, endLocationName);

  /// Create a copy of MatchPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchPayloadImplCopyWith<_$MatchPayloadImpl> get copyWith =>
      __$$MatchPayloadImplCopyWithImpl<_$MatchPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchPayloadImplToJson(
      this,
    );
  }
}

abstract class _MatchPayload implements MatchPayload {
  const factory _MatchPayload(
      {required final String startLocationName,
      required final String endLocationName}) = _$MatchPayloadImpl;

  factory _MatchPayload.fromJson(Map<String, dynamic> json) =
      _$MatchPayloadImpl.fromJson;

  @override
  String get startLocationName;
  @override
  String get endLocationName;

  /// Create a copy of MatchPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchPayloadImplCopyWith<_$MatchPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FriendRequestPayload _$FriendRequestPayloadFromJson(Map<String, dynamic> json) {
  return _FriendRequestPayload.fromJson(json);
}

/// @nodoc
mixin _$FriendRequestPayload {
  String get status => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  int get senderId => throw _privateConstructorUsedError;

  /// Serializes this FriendRequestPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FriendRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FriendRequestPayloadCopyWith<FriendRequestPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendRequestPayloadCopyWith<$Res> {
  factory $FriendRequestPayloadCopyWith(FriendRequestPayload value,
          $Res Function(FriendRequestPayload) then) =
      _$FriendRequestPayloadCopyWithImpl<$Res, FriendRequestPayload>;
  @useResult
  $Res call({String status, String? profilePicture, int senderId});
}

/// @nodoc
class _$FriendRequestPayloadCopyWithImpl<$Res,
        $Val extends FriendRequestPayload>
    implements $FriendRequestPayloadCopyWith<$Res> {
  _$FriendRequestPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FriendRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? profilePicture = freezed,
    Object? senderId = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendRequestPayloadImplCopyWith<$Res>
    implements $FriendRequestPayloadCopyWith<$Res> {
  factory _$$FriendRequestPayloadImplCopyWith(_$FriendRequestPayloadImpl value,
          $Res Function(_$FriendRequestPayloadImpl) then) =
      __$$FriendRequestPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? profilePicture, int senderId});
}

/// @nodoc
class __$$FriendRequestPayloadImplCopyWithImpl<$Res>
    extends _$FriendRequestPayloadCopyWithImpl<$Res, _$FriendRequestPayloadImpl>
    implements _$$FriendRequestPayloadImplCopyWith<$Res> {
  __$$FriendRequestPayloadImplCopyWithImpl(_$FriendRequestPayloadImpl _value,
      $Res Function(_$FriendRequestPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? profilePicture = freezed,
    Object? senderId = null,
  }) {
    return _then(_$FriendRequestPayloadImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendRequestPayloadImpl implements _FriendRequestPayload {
  const _$FriendRequestPayloadImpl(
      {required this.status, this.profilePicture, required this.senderId});

  factory _$FriendRequestPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendRequestPayloadImplFromJson(json);

  @override
  final String status;
  @override
  final String? profilePicture;
  @override
  final int senderId;

  @override
  String toString() {
    return 'FriendRequestPayload(status: $status, profilePicture: $profilePicture, senderId: $senderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendRequestPayloadImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, profilePicture, senderId);

  /// Create a copy of FriendRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendRequestPayloadImplCopyWith<_$FriendRequestPayloadImpl>
      get copyWith =>
          __$$FriendRequestPayloadImplCopyWithImpl<_$FriendRequestPayloadImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendRequestPayloadImplToJson(
      this,
    );
  }
}

abstract class _FriendRequestPayload implements FriendRequestPayload {
  const factory _FriendRequestPayload(
      {required final String status,
      final String? profilePicture,
      required final int senderId}) = _$FriendRequestPayloadImpl;

  factory _FriendRequestPayload.fromJson(Map<String, dynamic> json) =
      _$FriendRequestPayloadImpl.fromJson;

  @override
  String get status;
  @override
  String? get profilePicture;
  @override
  int get senderId;

  /// Create a copy of FriendRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendRequestPayloadImplCopyWith<_$FriendRequestPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MatchingRequestPayload _$MatchingRequestPayloadFromJson(
    Map<String, dynamic> json) {
  return _MatchingRequestPayload.fromJson(json);
}

/// @nodoc
mixin _$MatchingRequestPayload {
  String get senderNickname => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  int get matchingRoomId => throw _privateConstructorUsedError;

  /// Serializes this MatchingRequestPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingRequestPayloadCopyWith<MatchingRequestPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingRequestPayloadCopyWith<$Res> {
  factory $MatchingRequestPayloadCopyWith(MatchingRequestPayload value,
          $Res Function(MatchingRequestPayload) then) =
      _$MatchingRequestPayloadCopyWithImpl<$Res, MatchingRequestPayload>;
  @useResult
  $Res call(
      {String senderNickname, String? profilePicture, int matchingRoomId});
}

/// @nodoc
class _$MatchingRequestPayloadCopyWithImpl<$Res,
        $Val extends MatchingRequestPayload>
    implements $MatchingRequestPayloadCopyWith<$Res> {
  _$MatchingRequestPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderNickname = null,
    Object? profilePicture = freezed,
    Object? matchingRoomId = null,
  }) {
    return _then(_value.copyWith(
      senderNickname: null == senderNickname
          ? _value.senderNickname
          : senderNickname // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      matchingRoomId: null == matchingRoomId
          ? _value.matchingRoomId
          : matchingRoomId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchingRequestPayloadImplCopyWith<$Res>
    implements $MatchingRequestPayloadCopyWith<$Res> {
  factory _$$MatchingRequestPayloadImplCopyWith(
          _$MatchingRequestPayloadImpl value,
          $Res Function(_$MatchingRequestPayloadImpl) then) =
      __$$MatchingRequestPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String senderNickname, String? profilePicture, int matchingRoomId});
}

/// @nodoc
class __$$MatchingRequestPayloadImplCopyWithImpl<$Res>
    extends _$MatchingRequestPayloadCopyWithImpl<$Res,
        _$MatchingRequestPayloadImpl>
    implements _$$MatchingRequestPayloadImplCopyWith<$Res> {
  __$$MatchingRequestPayloadImplCopyWithImpl(
      _$MatchingRequestPayloadImpl _value,
      $Res Function(_$MatchingRequestPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchingRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderNickname = null,
    Object? profilePicture = freezed,
    Object? matchingRoomId = null,
  }) {
    return _then(_$MatchingRequestPayloadImpl(
      senderNickname: null == senderNickname
          ? _value.senderNickname
          : senderNickname // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      matchingRoomId: null == matchingRoomId
          ? _value.matchingRoomId
          : matchingRoomId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchingRequestPayloadImpl implements _MatchingRequestPayload {
  const _$MatchingRequestPayloadImpl(
      {required this.senderNickname,
      this.profilePicture,
      required this.matchingRoomId});

  factory _$MatchingRequestPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingRequestPayloadImplFromJson(json);

  @override
  final String senderNickname;
  @override
  final String? profilePicture;
  @override
  final int matchingRoomId;

  @override
  String toString() {
    return 'MatchingRequestPayload(senderNickname: $senderNickname, profilePicture: $profilePicture, matchingRoomId: $matchingRoomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingRequestPayloadImpl &&
            (identical(other.senderNickname, senderNickname) ||
                other.senderNickname == senderNickname) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.matchingRoomId, matchingRoomId) ||
                other.matchingRoomId == matchingRoomId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, senderNickname, profilePicture, matchingRoomId);

  /// Create a copy of MatchingRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingRequestPayloadImplCopyWith<_$MatchingRequestPayloadImpl>
      get copyWith => __$$MatchingRequestPayloadImplCopyWithImpl<
          _$MatchingRequestPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingRequestPayloadImplToJson(
      this,
    );
  }
}

abstract class _MatchingRequestPayload implements MatchingRequestPayload {
  const factory _MatchingRequestPayload(
      {required final String senderNickname,
      final String? profilePicture,
      required final int matchingRoomId}) = _$MatchingRequestPayloadImpl;

  factory _MatchingRequestPayload.fromJson(Map<String, dynamic> json) =
      _$MatchingRequestPayloadImpl.fromJson;

  @override
  String get senderNickname;
  @override
  String? get profilePicture;
  @override
  int get matchingRoomId;

  /// Create a copy of MatchingRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingRequestPayloadImplCopyWith<_$MatchingRequestPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
