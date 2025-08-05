// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_member_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMemberResponse _$ChatMemberResponseFromJson(Map<String, dynamic> json) {
  return _ChatMemberResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatMemberResponse {
  int get memberId => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this ChatMemberResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMemberResponseCopyWith<ChatMemberResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMemberResponseCopyWith<$Res> {
  factory $ChatMemberResponseCopyWith(
          ChatMemberResponse value, $Res Function(ChatMemberResponse) then) =
      _$ChatMemberResponseCopyWithImpl<$Res, ChatMemberResponse>;
  @useResult
  $Res call({int memberId, String nickName, String profilePicture});
}

/// @nodoc
class _$ChatMemberResponseCopyWithImpl<$Res, $Val extends ChatMemberResponse>
    implements $ChatMemberResponseCopyWith<$Res> {
  _$ChatMemberResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? nickName = null,
    Object? profilePicture = null,
  }) {
    return _then(_value.copyWith(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMemberResponseImplCopyWith<$Res>
    implements $ChatMemberResponseCopyWith<$Res> {
  factory _$$ChatMemberResponseImplCopyWith(_$ChatMemberResponseImpl value,
          $Res Function(_$ChatMemberResponseImpl) then) =
      __$$ChatMemberResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int memberId, String nickName, String profilePicture});
}

/// @nodoc
class __$$ChatMemberResponseImplCopyWithImpl<$Res>
    extends _$ChatMemberResponseCopyWithImpl<$Res, _$ChatMemberResponseImpl>
    implements _$$ChatMemberResponseImplCopyWith<$Res> {
  __$$ChatMemberResponseImplCopyWithImpl(_$ChatMemberResponseImpl _value,
      $Res Function(_$ChatMemberResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? nickName = null,
    Object? profilePicture = null,
  }) {
    return _then(_$ChatMemberResponseImpl(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMemberResponseImpl implements _ChatMemberResponse {
  const _$ChatMemberResponseImpl(
      {required this.memberId,
      required this.nickName,
      required this.profilePicture});

  factory _$ChatMemberResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMemberResponseImplFromJson(json);

  @override
  final int memberId;
  @override
  final String nickName;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'ChatMemberResponse(memberId: $memberId, nickName: $nickName, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMemberResponseImpl &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, memberId, nickName, profilePicture);

  /// Create a copy of ChatMemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMemberResponseImplCopyWith<_$ChatMemberResponseImpl> get copyWith =>
      __$$ChatMemberResponseImplCopyWithImpl<_$ChatMemberResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMemberResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatMemberResponse implements ChatMemberResponse {
  const factory _ChatMemberResponse(
      {required final int memberId,
      required final String nickName,
      required final String profilePicture}) = _$ChatMemberResponseImpl;

  factory _ChatMemberResponse.fromJson(Map<String, dynamic> json) =
      _$ChatMemberResponseImpl.fromJson;

  @override
  int get memberId;
  @override
  String get nickName;
  @override
  String get profilePicture;

  /// Create a copy of ChatMemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMemberResponseImplCopyWith<_$ChatMemberResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
