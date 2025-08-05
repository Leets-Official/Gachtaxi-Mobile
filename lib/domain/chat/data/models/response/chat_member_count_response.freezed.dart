// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_member_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMemberCountResponse _$ChatMemberCountResponseFromJson(
    Map<String, dynamic> json) {
  return _ChatMemberCountResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatMemberCountResponse {
  int get roomId => throw _privateConstructorUsedError;
  int get totalParticipantCount => throw _privateConstructorUsedError;
  ChatMemberResponse get roomMaster => throw _privateConstructorUsedError;
  List<ChatMemberResponse> get participants =>
      throw _privateConstructorUsedError;

  /// Serializes this ChatMemberCountResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMemberCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMemberCountResponseCopyWith<ChatMemberCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMemberCountResponseCopyWith<$Res> {
  factory $ChatMemberCountResponseCopyWith(ChatMemberCountResponse value,
          $Res Function(ChatMemberCountResponse) then) =
      _$ChatMemberCountResponseCopyWithImpl<$Res, ChatMemberCountResponse>;
  @useResult
  $Res call(
      {int roomId,
      int totalParticipantCount,
      ChatMemberResponse roomMaster,
      List<ChatMemberResponse> participants});

  $ChatMemberResponseCopyWith<$Res> get roomMaster;
}

/// @nodoc
class _$ChatMemberCountResponseCopyWithImpl<$Res,
        $Val extends ChatMemberCountResponse>
    implements $ChatMemberCountResponseCopyWith<$Res> {
  _$ChatMemberCountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMemberCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? totalParticipantCount = null,
    Object? roomMaster = null,
    Object? participants = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      totalParticipantCount: null == totalParticipantCount
          ? _value.totalParticipantCount
          : totalParticipantCount // ignore: cast_nullable_to_non_nullable
              as int,
      roomMaster: null == roomMaster
          ? _value.roomMaster
          : roomMaster // ignore: cast_nullable_to_non_nullable
              as ChatMemberResponse,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ChatMemberResponse>,
    ) as $Val);
  }

  /// Create a copy of ChatMemberCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMemberResponseCopyWith<$Res> get roomMaster {
    return $ChatMemberResponseCopyWith<$Res>(_value.roomMaster, (value) {
      return _then(_value.copyWith(roomMaster: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatMemberCountResponseImplCopyWith<$Res>
    implements $ChatMemberCountResponseCopyWith<$Res> {
  factory _$$ChatMemberCountResponseImplCopyWith(
          _$ChatMemberCountResponseImpl value,
          $Res Function(_$ChatMemberCountResponseImpl) then) =
      __$$ChatMemberCountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int roomId,
      int totalParticipantCount,
      ChatMemberResponse roomMaster,
      List<ChatMemberResponse> participants});

  @override
  $ChatMemberResponseCopyWith<$Res> get roomMaster;
}

/// @nodoc
class __$$ChatMemberCountResponseImplCopyWithImpl<$Res>
    extends _$ChatMemberCountResponseCopyWithImpl<$Res,
        _$ChatMemberCountResponseImpl>
    implements _$$ChatMemberCountResponseImplCopyWith<$Res> {
  __$$ChatMemberCountResponseImplCopyWithImpl(
      _$ChatMemberCountResponseImpl _value,
      $Res Function(_$ChatMemberCountResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMemberCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? totalParticipantCount = null,
    Object? roomMaster = null,
    Object? participants = null,
  }) {
    return _then(_$ChatMemberCountResponseImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      totalParticipantCount: null == totalParticipantCount
          ? _value.totalParticipantCount
          : totalParticipantCount // ignore: cast_nullable_to_non_nullable
              as int,
      roomMaster: null == roomMaster
          ? _value.roomMaster
          : roomMaster // ignore: cast_nullable_to_non_nullable
              as ChatMemberResponse,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ChatMemberResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMemberCountResponseImpl implements _ChatMemberCountResponse {
  const _$ChatMemberCountResponseImpl(
      {required this.roomId,
      required this.totalParticipantCount,
      required this.roomMaster,
      required final List<ChatMemberResponse> participants})
      : _participants = participants;

  factory _$ChatMemberCountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMemberCountResponseImplFromJson(json);

  @override
  final int roomId;
  @override
  final int totalParticipantCount;
  @override
  final ChatMemberResponse roomMaster;
  final List<ChatMemberResponse> _participants;
  @override
  List<ChatMemberResponse> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'ChatMemberCountResponse(roomId: $roomId, totalParticipantCount: $totalParticipantCount, roomMaster: $roomMaster, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMemberCountResponseImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.totalParticipantCount, totalParticipantCount) ||
                other.totalParticipantCount == totalParticipantCount) &&
            (identical(other.roomMaster, roomMaster) ||
                other.roomMaster == roomMaster) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, totalParticipantCount,
      roomMaster, const DeepCollectionEquality().hash(_participants));

  /// Create a copy of ChatMemberCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMemberCountResponseImplCopyWith<_$ChatMemberCountResponseImpl>
      get copyWith => __$$ChatMemberCountResponseImplCopyWithImpl<
          _$ChatMemberCountResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMemberCountResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatMemberCountResponse implements ChatMemberCountResponse {
  const factory _ChatMemberCountResponse(
          {required final int roomId,
          required final int totalParticipantCount,
          required final ChatMemberResponse roomMaster,
          required final List<ChatMemberResponse> participants}) =
      _$ChatMemberCountResponseImpl;

  factory _ChatMemberCountResponse.fromJson(Map<String, dynamic> json) =
      _$ChatMemberCountResponseImpl.fromJson;

  @override
  int get roomId;
  @override
  int get totalParticipantCount;
  @override
  ChatMemberResponse get roomMaster;
  @override
  List<ChatMemberResponse> get participants;

  /// Create a copy of ChatMemberCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMemberCountResponseImplCopyWith<_$ChatMemberCountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
