// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) {
  return _ChatMessageModel.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageModel {
  String? get messageId => throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  int get senderId => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  int? get unreadCount => throw _privateConstructorUsedError;
  DateTime get timeStamp => throw _privateConstructorUsedError;
  MessageType get messageType => throw _privateConstructorUsedError;
  String? get startMessageId => throw _privateConstructorUsedError;
  String? get endMessageId => throw _privateConstructorUsedError;

  /// Serializes this ChatMessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageModelCopyWith<ChatMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageModelCopyWith<$Res> {
  factory $ChatMessageModelCopyWith(
          ChatMessageModel value, $Res Function(ChatMessageModel) then) =
      _$ChatMessageModelCopyWithImpl<$Res, ChatMessageModel>;
  @useResult
  $Res call(
      {String? messageId,
      int? roomId,
      int senderId,
      String senderName,
      String? message,
      String? profilePicture,
      int? unreadCount,
      DateTime timeStamp,
      MessageType messageType,
      String? startMessageId,
      String? endMessageId});
}

/// @nodoc
class _$ChatMessageModelCopyWithImpl<$Res, $Val extends ChatMessageModel>
    implements $ChatMessageModelCopyWith<$Res> {
  _$ChatMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = freezed,
    Object? roomId = freezed,
    Object? senderId = null,
    Object? senderName = null,
    Object? message = freezed,
    Object? profilePicture = freezed,
    Object? unreadCount = freezed,
    Object? timeStamp = null,
    Object? messageType = null,
    Object? startMessageId = freezed,
    Object? endMessageId = freezed,
  }) {
    return _then(_value.copyWith(
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadCount: freezed == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      startMessageId: freezed == startMessageId
          ? _value.startMessageId
          : startMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      endMessageId: freezed == endMessageId
          ? _value.endMessageId
          : endMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageModelImplCopyWith<$Res>
    implements $ChatMessageModelCopyWith<$Res> {
  factory _$$ChatMessageModelImplCopyWith(_$ChatMessageModelImpl value,
          $Res Function(_$ChatMessageModelImpl) then) =
      __$$ChatMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? messageId,
      int? roomId,
      int senderId,
      String senderName,
      String? message,
      String? profilePicture,
      int? unreadCount,
      DateTime timeStamp,
      MessageType messageType,
      String? startMessageId,
      String? endMessageId});
}

/// @nodoc
class __$$ChatMessageModelImplCopyWithImpl<$Res>
    extends _$ChatMessageModelCopyWithImpl<$Res, _$ChatMessageModelImpl>
    implements _$$ChatMessageModelImplCopyWith<$Res> {
  __$$ChatMessageModelImplCopyWithImpl(_$ChatMessageModelImpl _value,
      $Res Function(_$ChatMessageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = freezed,
    Object? roomId = freezed,
    Object? senderId = null,
    Object? senderName = null,
    Object? message = freezed,
    Object? profilePicture = freezed,
    Object? unreadCount = freezed,
    Object? timeStamp = null,
    Object? messageType = null,
    Object? startMessageId = freezed,
    Object? endMessageId = freezed,
  }) {
    return _then(_$ChatMessageModelImpl(
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadCount: freezed == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      startMessageId: freezed == startMessageId
          ? _value.startMessageId
          : startMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      endMessageId: freezed == endMessageId
          ? _value.endMessageId
          : endMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageModelImpl implements _ChatMessageModel {
  const _$ChatMessageModelImpl(
      {this.messageId,
      this.roomId,
      required this.senderId,
      required this.senderName,
      this.message,
      this.profilePicture,
      this.unreadCount,
      required this.timeStamp,
      required this.messageType,
      this.startMessageId,
      this.endMessageId});

  factory _$ChatMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageModelImplFromJson(json);

  @override
  final String? messageId;
  @override
  final int? roomId;
  @override
  final int senderId;
  @override
  final String senderName;
  @override
  final String? message;
  @override
  final String? profilePicture;
  @override
  final int? unreadCount;
  @override
  final DateTime timeStamp;
  @override
  final MessageType messageType;
  @override
  final String? startMessageId;
  @override
  final String? endMessageId;

  @override
  String toString() {
    return 'ChatMessageModel(messageId: $messageId, roomId: $roomId, senderId: $senderId, senderName: $senderName, message: $message, profilePicture: $profilePicture, unreadCount: $unreadCount, timeStamp: $timeStamp, messageType: $messageType, startMessageId: $startMessageId, endMessageId: $endMessageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageModelImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.startMessageId, startMessageId) ||
                other.startMessageId == startMessageId) &&
            (identical(other.endMessageId, endMessageId) ||
                other.endMessageId == endMessageId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      messageId,
      roomId,
      senderId,
      senderName,
      message,
      profilePicture,
      unreadCount,
      timeStamp,
      messageType,
      startMessageId,
      endMessageId);

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageModelImplCopyWith<_$ChatMessageModelImpl> get copyWith =>
      __$$ChatMessageModelImplCopyWithImpl<_$ChatMessageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageModelImplToJson(
      this,
    );
  }
}

abstract class _ChatMessageModel implements ChatMessageModel {
  const factory _ChatMessageModel(
      {final String? messageId,
      final int? roomId,
      required final int senderId,
      required final String senderName,
      final String? message,
      final String? profilePicture,
      final int? unreadCount,
      required final DateTime timeStamp,
      required final MessageType messageType,
      final String? startMessageId,
      final String? endMessageId}) = _$ChatMessageModelImpl;

  factory _ChatMessageModel.fromJson(Map<String, dynamic> json) =
      _$ChatMessageModelImpl.fromJson;

  @override
  String? get messageId;
  @override
  int? get roomId;
  @override
  int get senderId;
  @override
  String get senderName;
  @override
  String? get message;
  @override
  String? get profilePicture;
  @override
  int? get unreadCount;
  @override
  DateTime get timeStamp;
  @override
  MessageType get messageType;
  @override
  String? get startMessageId;
  @override
  String? get endMessageId;

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageModelImplCopyWith<_$ChatMessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
