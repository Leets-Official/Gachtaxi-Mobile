// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blacklist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Blacklist _$BlacklistFromJson(Map<String, dynamic> json) {
  return _Blacklist.fromJson(json);
}

/// @nodoc
mixin _$Blacklist {
  int get receiverId => throw _privateConstructorUsedError;
  String get receiverNickname => throw _privateConstructorUsedError;
  String get receiverProfilePicture => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;

  /// Serializes this Blacklist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Blacklist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlacklistCopyWith<Blacklist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlacklistCopyWith<$Res> {
  factory $BlacklistCopyWith(Blacklist value, $Res Function(Blacklist) then) =
      _$BlacklistCopyWithImpl<$Res, Blacklist>;
  @useResult
  $Res call(
      {int receiverId,
      String receiverNickname,
      String receiverProfilePicture,
      Gender gender});
}

/// @nodoc
class _$BlacklistCopyWithImpl<$Res, $Val extends Blacklist>
    implements $BlacklistCopyWith<$Res> {
  _$BlacklistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Blacklist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverId = null,
    Object? receiverNickname = null,
    Object? receiverProfilePicture = null,
    Object? gender = null,
  }) {
    return _then(_value.copyWith(
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverNickname: null == receiverNickname
          ? _value.receiverNickname
          : receiverNickname // ignore: cast_nullable_to_non_nullable
              as String,
      receiverProfilePicture: null == receiverProfilePicture
          ? _value.receiverProfilePicture
          : receiverProfilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlacklistImplCopyWith<$Res>
    implements $BlacklistCopyWith<$Res> {
  factory _$$BlacklistImplCopyWith(
          _$BlacklistImpl value, $Res Function(_$BlacklistImpl) then) =
      __$$BlacklistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int receiverId,
      String receiverNickname,
      String receiverProfilePicture,
      Gender gender});
}

/// @nodoc
class __$$BlacklistImplCopyWithImpl<$Res>
    extends _$BlacklistCopyWithImpl<$Res, _$BlacklistImpl>
    implements _$$BlacklistImplCopyWith<$Res> {
  __$$BlacklistImplCopyWithImpl(
      _$BlacklistImpl _value, $Res Function(_$BlacklistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Blacklist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverId = null,
    Object? receiverNickname = null,
    Object? receiverProfilePicture = null,
    Object? gender = null,
  }) {
    return _then(_$BlacklistImpl(
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverNickname: null == receiverNickname
          ? _value.receiverNickname
          : receiverNickname // ignore: cast_nullable_to_non_nullable
              as String,
      receiverProfilePicture: null == receiverProfilePicture
          ? _value.receiverProfilePicture
          : receiverProfilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlacklistImpl implements _Blacklist {
  const _$BlacklistImpl(
      {required this.receiverId,
      required this.receiverNickname,
      required this.receiverProfilePicture,
      required this.gender});

  factory _$BlacklistImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlacklistImplFromJson(json);

  @override
  final int receiverId;
  @override
  final String receiverNickname;
  @override
  final String receiverProfilePicture;
  @override
  final Gender gender;

  @override
  String toString() {
    return 'Blacklist(receiverId: $receiverId, receiverNickname: $receiverNickname, receiverProfilePicture: $receiverProfilePicture, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlacklistImpl &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiverNickname, receiverNickname) ||
                other.receiverNickname == receiverNickname) &&
            (identical(other.receiverProfilePicture, receiverProfilePicture) ||
                other.receiverProfilePicture == receiverProfilePicture) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, receiverId, receiverNickname,
      receiverProfilePicture, gender);

  /// Create a copy of Blacklist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlacklistImplCopyWith<_$BlacklistImpl> get copyWith =>
      __$$BlacklistImplCopyWithImpl<_$BlacklistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlacklistImplToJson(
      this,
    );
  }
}

abstract class _Blacklist implements Blacklist {
  const factory _Blacklist(
      {required final int receiverId,
      required final String receiverNickname,
      required final String receiverProfilePicture,
      required final Gender gender}) = _$BlacklistImpl;

  factory _Blacklist.fromJson(Map<String, dynamic> json) =
      _$BlacklistImpl.fromJson;

  @override
  int get receiverId;
  @override
  String get receiverNickname;
  @override
  String get receiverProfilePicture;
  @override
  Gender get gender;

  /// Create a copy of Blacklist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlacklistImplCopyWith<_$BlacklistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
