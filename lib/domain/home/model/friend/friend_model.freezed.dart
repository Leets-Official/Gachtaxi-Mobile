// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return _Friend.fromJson(json);
}

/// @nodoc
mixin _$Friend {
  int get friendsId => throw _privateConstructorUsedError;
  String get friendsNickName => throw _privateConstructorUsedError;
  String get friendsProfileUrl => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  int get chatRoomId => throw _privateConstructorUsedError;

  /// Serializes this Friend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Friend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FriendCopyWith<Friend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res, Friend>;
  @useResult
  $Res call(
      {int friendsId,
      String friendsNickName,
      String friendsProfileUrl,
      Gender gender,
      int chatRoomId});
}

/// @nodoc
class _$FriendCopyWithImpl<$Res, $Val extends Friend>
    implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Friend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendsId = null,
    Object? friendsNickName = null,
    Object? friendsProfileUrl = null,
    Object? gender = null,
    Object? chatRoomId = null,
  }) {
    return _then(_value.copyWith(
      friendsId: null == friendsId
          ? _value.friendsId
          : friendsId // ignore: cast_nullable_to_non_nullable
              as int,
      friendsNickName: null == friendsNickName
          ? _value.friendsNickName
          : friendsNickName // ignore: cast_nullable_to_non_nullable
              as String,
      friendsProfileUrl: null == friendsProfileUrl
          ? _value.friendsProfileUrl
          : friendsProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendImplCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory _$$FriendImplCopyWith(
          _$FriendImpl value, $Res Function(_$FriendImpl) then) =
      __$$FriendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int friendsId,
      String friendsNickName,
      String friendsProfileUrl,
      Gender gender,
      int chatRoomId});
}

/// @nodoc
class __$$FriendImplCopyWithImpl<$Res>
    extends _$FriendCopyWithImpl<$Res, _$FriendImpl>
    implements _$$FriendImplCopyWith<$Res> {
  __$$FriendImplCopyWithImpl(
      _$FriendImpl _value, $Res Function(_$FriendImpl) _then)
      : super(_value, _then);

  /// Create a copy of Friend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendsId = null,
    Object? friendsNickName = null,
    Object? friendsProfileUrl = null,
    Object? gender = null,
    Object? chatRoomId = null,
  }) {
    return _then(_$FriendImpl(
      friendsId: null == friendsId
          ? _value.friendsId
          : friendsId // ignore: cast_nullable_to_non_nullable
              as int,
      friendsNickName: null == friendsNickName
          ? _value.friendsNickName
          : friendsNickName // ignore: cast_nullable_to_non_nullable
              as String,
      friendsProfileUrl: null == friendsProfileUrl
          ? _value.friendsProfileUrl
          : friendsProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendImpl implements _Friend {
  const _$FriendImpl(
      {required this.friendsId,
      required this.friendsNickName,
      required this.friendsProfileUrl,
      required this.gender,
      required this.chatRoomId});

  factory _$FriendImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendImplFromJson(json);

  @override
  final int friendsId;
  @override
  final String friendsNickName;
  @override
  final String friendsProfileUrl;
  @override
  final Gender gender;
  @override
  final int chatRoomId;

  @override
  String toString() {
    return 'Friend(friendsId: $friendsId, friendsNickName: $friendsNickName, friendsProfileUrl: $friendsProfileUrl, gender: $gender, chatRoomId: $chatRoomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendImpl &&
            (identical(other.friendsId, friendsId) ||
                other.friendsId == friendsId) &&
            (identical(other.friendsNickName, friendsNickName) ||
                other.friendsNickName == friendsNickName) &&
            (identical(other.friendsProfileUrl, friendsProfileUrl) ||
                other.friendsProfileUrl == friendsProfileUrl) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, friendsId, friendsNickName,
      friendsProfileUrl, gender, chatRoomId);

  /// Create a copy of Friend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendImplCopyWith<_$FriendImpl> get copyWith =>
      __$$FriendImplCopyWithImpl<_$FriendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendImplToJson(
      this,
    );
  }
}

abstract class _Friend implements Friend {
  const factory _Friend(
      {required final int friendsId,
      required final String friendsNickName,
      required final String friendsProfileUrl,
      required final Gender gender,
      required final int chatRoomId}) = _$FriendImpl;

  factory _Friend.fromJson(Map<String, dynamic> json) = _$FriendImpl.fromJson;

  @override
  int get friendsId;
  @override
  String get friendsNickName;
  @override
  String get friendsProfileUrl;
  @override
  Gender get gender;
  @override
  int get chatRoomId;

  /// Create a copy of Friend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendImplCopyWith<_$FriendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
