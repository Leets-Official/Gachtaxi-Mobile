// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manual_matching_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchingData _$MatchingDataFromJson(Map<String, dynamic> json) {
  return _MatchingData.fromJson(json);
}

/// @nodoc
mixin _$MatchingData {
  List<MatchingRoom> get rooms => throw _privateConstructorUsedError;
  Pageable get pageable => throw _privateConstructorUsedError;

  /// Serializes this MatchingData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingDataCopyWith<MatchingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingDataCopyWith<$Res> {
  factory $MatchingDataCopyWith(
          MatchingData value, $Res Function(MatchingData) then) =
      _$MatchingDataCopyWithImpl<$Res, MatchingData>;
  @useResult
  $Res call({List<MatchingRoom> rooms, Pageable pageable});

  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class _$MatchingDataCopyWithImpl<$Res, $Val extends MatchingData>
    implements $MatchingDataCopyWith<$Res> {
  _$MatchingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
    Object? pageable = null,
  }) {
    return _then(_value.copyWith(
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<MatchingRoom>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ) as $Val);
  }

  /// Create a copy of MatchingData
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
abstract class _$$MatchingDataImplCopyWith<$Res>
    implements $MatchingDataCopyWith<$Res> {
  factory _$$MatchingDataImplCopyWith(
          _$MatchingDataImpl value, $Res Function(_$MatchingDataImpl) then) =
      __$$MatchingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MatchingRoom> rooms, Pageable pageable});

  @override
  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class __$$MatchingDataImplCopyWithImpl<$Res>
    extends _$MatchingDataCopyWithImpl<$Res, _$MatchingDataImpl>
    implements _$$MatchingDataImplCopyWith<$Res> {
  __$$MatchingDataImplCopyWithImpl(
      _$MatchingDataImpl _value, $Res Function(_$MatchingDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
    Object? pageable = null,
  }) {
    return _then(_$MatchingDataImpl(
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<MatchingRoom>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchingDataImpl implements _MatchingData {
  const _$MatchingDataImpl(
      {required final List<MatchingRoom> rooms, required this.pageable})
      : _rooms = rooms;

  factory _$MatchingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingDataImplFromJson(json);

  final List<MatchingRoom> _rooms;
  @override
  List<MatchingRoom> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  final Pageable pageable;

  @override
  String toString() {
    return 'MatchingData(rooms: $rooms, pageable: $pageable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingDataImpl &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_rooms), pageable);

  /// Create a copy of MatchingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingDataImplCopyWith<_$MatchingDataImpl> get copyWith =>
      __$$MatchingDataImplCopyWithImpl<_$MatchingDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingDataImplToJson(
      this,
    );
  }
}

abstract class _MatchingData implements MatchingData {
  const factory _MatchingData(
      {required final List<MatchingRoom> rooms,
      required final Pageable pageable}) = _$MatchingDataImpl;

  factory _MatchingData.fromJson(Map<String, dynamic> json) =
      _$MatchingDataImpl.fromJson;

  @override
  List<MatchingRoom> get rooms;
  @override
  Pageable get pageable;

  /// Create a copy of MatchingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingDataImplCopyWith<_$MatchingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
