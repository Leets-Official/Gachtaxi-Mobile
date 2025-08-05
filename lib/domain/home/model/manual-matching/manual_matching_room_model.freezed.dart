// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manual_matching_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchingRoom _$MatchingRoomFromJson(Map<String, dynamic> json) {
  return _MatchingRoom.fromJson(json);
}

/// @nodoc
mixin _$MatchingRoom {
  int get roomId => throw _privateConstructorUsedError;
  int get chattingRoomId => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get departure => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  String get departureTime => throw _privateConstructorUsedError;
  String? get departureDate => throw _privateConstructorUsedError;
  int get maxCapacity => throw _privateConstructorUsedError;
  int get currentMembers => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// Serializes this MatchingRoom to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingRoomCopyWith<MatchingRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingRoomCopyWith<$Res> {
  factory $MatchingRoomCopyWith(
          MatchingRoom value, $Res Function(MatchingRoom) then) =
      _$MatchingRoomCopyWithImpl<$Res, MatchingRoom>;
  @useResult
  $Res call(
      {int roomId,
      int chattingRoomId,
      String? nickname,
      String? profilePicture,
      String? gender,
      String description,
      String departure,
      String destination,
      String departureTime,
      String? departureDate,
      int maxCapacity,
      int currentMembers,
      List<String> tags});
}

/// @nodoc
class _$MatchingRoomCopyWithImpl<$Res, $Val extends MatchingRoom>
    implements $MatchingRoomCopyWith<$Res> {
  _$MatchingRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? chattingRoomId = null,
    Object? nickname = freezed,
    Object? profilePicture = freezed,
    Object? gender = freezed,
    Object? description = null,
    Object? departure = null,
    Object? destination = null,
    Object? departureTime = null,
    Object? departureDate = freezed,
    Object? maxCapacity = null,
    Object? currentMembers = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      chattingRoomId: null == chattingRoomId
          ? _value.chattingRoomId
          : chattingRoomId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      departure: null == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as String?,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      currentMembers: null == currentMembers
          ? _value.currentMembers
          : currentMembers // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchingRoomImplCopyWith<$Res>
    implements $MatchingRoomCopyWith<$Res> {
  factory _$$MatchingRoomImplCopyWith(
          _$MatchingRoomImpl value, $Res Function(_$MatchingRoomImpl) then) =
      __$$MatchingRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int roomId,
      int chattingRoomId,
      String? nickname,
      String? profilePicture,
      String? gender,
      String description,
      String departure,
      String destination,
      String departureTime,
      String? departureDate,
      int maxCapacity,
      int currentMembers,
      List<String> tags});
}

/// @nodoc
class __$$MatchingRoomImplCopyWithImpl<$Res>
    extends _$MatchingRoomCopyWithImpl<$Res, _$MatchingRoomImpl>
    implements _$$MatchingRoomImplCopyWith<$Res> {
  __$$MatchingRoomImplCopyWithImpl(
      _$MatchingRoomImpl _value, $Res Function(_$MatchingRoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchingRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? chattingRoomId = null,
    Object? nickname = freezed,
    Object? profilePicture = freezed,
    Object? gender = freezed,
    Object? description = null,
    Object? departure = null,
    Object? destination = null,
    Object? departureTime = null,
    Object? departureDate = freezed,
    Object? maxCapacity = null,
    Object? currentMembers = null,
    Object? tags = null,
  }) {
    return _then(_$MatchingRoomImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      chattingRoomId: null == chattingRoomId
          ? _value.chattingRoomId
          : chattingRoomId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      departure: null == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as String?,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      currentMembers: null == currentMembers
          ? _value.currentMembers
          : currentMembers // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchingRoomImpl implements _MatchingRoom {
  const _$MatchingRoomImpl(
      {required this.roomId,
      required this.chattingRoomId,
      this.nickname,
      this.profilePicture,
      this.gender,
      required this.description,
      required this.departure,
      required this.destination,
      required this.departureTime,
      this.departureDate,
      required this.maxCapacity,
      required this.currentMembers,
      required final List<String> tags})
      : _tags = tags;

  factory _$MatchingRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingRoomImplFromJson(json);

  @override
  final int roomId;
  @override
  final int chattingRoomId;
  @override
  final String? nickname;
  @override
  final String? profilePicture;
  @override
  final String? gender;
  @override
  final String description;
  @override
  final String departure;
  @override
  final String destination;
  @override
  final String departureTime;
  @override
  final String? departureDate;
  @override
  final int maxCapacity;
  @override
  final int currentMembers;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'MatchingRoom(roomId: $roomId, chattingRoomId: $chattingRoomId, nickname: $nickname, profilePicture: $profilePicture, gender: $gender, description: $description, departure: $departure, destination: $destination, departureTime: $departureTime, departureDate: $departureDate, maxCapacity: $maxCapacity, currentMembers: $currentMembers, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingRoomImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.chattingRoomId, chattingRoomId) ||
                other.chattingRoomId == chattingRoomId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.departureDate, departureDate) ||
                other.departureDate == departureDate) &&
            (identical(other.maxCapacity, maxCapacity) ||
                other.maxCapacity == maxCapacity) &&
            (identical(other.currentMembers, currentMembers) ||
                other.currentMembers == currentMembers) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      roomId,
      chattingRoomId,
      nickname,
      profilePicture,
      gender,
      description,
      departure,
      destination,
      departureTime,
      departureDate,
      maxCapacity,
      currentMembers,
      const DeepCollectionEquality().hash(_tags));

  /// Create a copy of MatchingRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingRoomImplCopyWith<_$MatchingRoomImpl> get copyWith =>
      __$$MatchingRoomImplCopyWithImpl<_$MatchingRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingRoomImplToJson(
      this,
    );
  }
}

abstract class _MatchingRoom implements MatchingRoom {
  const factory _MatchingRoom(
      {required final int roomId,
      required final int chattingRoomId,
      final String? nickname,
      final String? profilePicture,
      final String? gender,
      required final String description,
      required final String departure,
      required final String destination,
      required final String departureTime,
      final String? departureDate,
      required final int maxCapacity,
      required final int currentMembers,
      required final List<String> tags}) = _$MatchingRoomImpl;

  factory _MatchingRoom.fromJson(Map<String, dynamic> json) =
      _$MatchingRoomImpl.fromJson;

  @override
  int get roomId;
  @override
  int get chattingRoomId;
  @override
  String? get nickname;
  @override
  String? get profilePicture;
  @override
  String? get gender;
  @override
  String get description;
  @override
  String get departure;
  @override
  String get destination;
  @override
  String get departureTime;
  @override
  String? get departureDate;
  @override
  int get maxCapacity;
  @override
  int get currentMembers;
  @override
  List<String> get tags;

  /// Create a copy of MatchingRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingRoomImplCopyWith<_$MatchingRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
