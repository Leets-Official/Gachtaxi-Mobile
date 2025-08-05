// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auto_matching_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AutoMatchingRequest _$AutoMatchingRequestFromJson(Map<String, dynamic> json) {
  return _AutoMatchingRequest.fromJson(json);
}

/// @nodoc
mixin _$AutoMatchingRequest {
  String get startPoint => throw _privateConstructorUsedError;
  String get destinationPoint => throw _privateConstructorUsedError;
  String? get startName => throw _privateConstructorUsedError;
  String? get destinationName => throw _privateConstructorUsedError;
  List<String>? get criteria => throw _privateConstructorUsedError;
  List<String>? get members => throw _privateConstructorUsedError;
  int? get expectedTotalCharge => throw _privateConstructorUsedError;
  String? get departure => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;

  /// Serializes this AutoMatchingRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AutoMatchingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutoMatchingRequestCopyWith<AutoMatchingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoMatchingRequestCopyWith<$Res> {
  factory $AutoMatchingRequestCopyWith(
          AutoMatchingRequest value, $Res Function(AutoMatchingRequest) then) =
      _$AutoMatchingRequestCopyWithImpl<$Res, AutoMatchingRequest>;
  @useResult
  $Res call(
      {String startPoint,
      String destinationPoint,
      String? startName,
      String? destinationName,
      List<String>? criteria,
      List<String>? members,
      int? expectedTotalCharge,
      String? departure,
      String? destination});
}

/// @nodoc
class _$AutoMatchingRequestCopyWithImpl<$Res, $Val extends AutoMatchingRequest>
    implements $AutoMatchingRequestCopyWith<$Res> {
  _$AutoMatchingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutoMatchingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startPoint = null,
    Object? destinationPoint = null,
    Object? startName = freezed,
    Object? destinationName = freezed,
    Object? criteria = freezed,
    Object? members = freezed,
    Object? expectedTotalCharge = freezed,
    Object? departure = freezed,
    Object? destination = freezed,
  }) {
    return _then(_value.copyWith(
      startPoint: null == startPoint
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as String,
      destinationPoint: null == destinationPoint
          ? _value.destinationPoint
          : destinationPoint // ignore: cast_nullable_to_non_nullable
              as String,
      startName: freezed == startName
          ? _value.startName
          : startName // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationName: freezed == destinationName
          ? _value.destinationName
          : destinationName // ignore: cast_nullable_to_non_nullable
              as String?,
      criteria: freezed == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      expectedTotalCharge: freezed == expectedTotalCharge
          ? _value.expectedTotalCharge
          : expectedTotalCharge // ignore: cast_nullable_to_non_nullable
              as int?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutoMatchingRequestImplCopyWith<$Res>
    implements $AutoMatchingRequestCopyWith<$Res> {
  factory _$$AutoMatchingRequestImplCopyWith(_$AutoMatchingRequestImpl value,
          $Res Function(_$AutoMatchingRequestImpl) then) =
      __$$AutoMatchingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String startPoint,
      String destinationPoint,
      String? startName,
      String? destinationName,
      List<String>? criteria,
      List<String>? members,
      int? expectedTotalCharge,
      String? departure,
      String? destination});
}

/// @nodoc
class __$$AutoMatchingRequestImplCopyWithImpl<$Res>
    extends _$AutoMatchingRequestCopyWithImpl<$Res, _$AutoMatchingRequestImpl>
    implements _$$AutoMatchingRequestImplCopyWith<$Res> {
  __$$AutoMatchingRequestImplCopyWithImpl(_$AutoMatchingRequestImpl _value,
      $Res Function(_$AutoMatchingRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AutoMatchingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startPoint = null,
    Object? destinationPoint = null,
    Object? startName = freezed,
    Object? destinationName = freezed,
    Object? criteria = freezed,
    Object? members = freezed,
    Object? expectedTotalCharge = freezed,
    Object? departure = freezed,
    Object? destination = freezed,
  }) {
    return _then(_$AutoMatchingRequestImpl(
      startPoint: null == startPoint
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as String,
      destinationPoint: null == destinationPoint
          ? _value.destinationPoint
          : destinationPoint // ignore: cast_nullable_to_non_nullable
              as String,
      startName: freezed == startName
          ? _value.startName
          : startName // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationName: freezed == destinationName
          ? _value.destinationName
          : destinationName // ignore: cast_nullable_to_non_nullable
              as String?,
      criteria: freezed == criteria
          ? _value._criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      expectedTotalCharge: freezed == expectedTotalCharge
          ? _value.expectedTotalCharge
          : expectedTotalCharge // ignore: cast_nullable_to_non_nullable
              as int?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutoMatchingRequestImpl implements _AutoMatchingRequest {
  const _$AutoMatchingRequestImpl(
      {required this.startPoint,
      required this.destinationPoint,
      this.startName,
      this.destinationName,
      final List<String>? criteria,
      final List<String>? members,
      this.expectedTotalCharge,
      this.departure,
      this.destination})
      : _criteria = criteria,
        _members = members;

  factory _$AutoMatchingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutoMatchingRequestImplFromJson(json);

  @override
  final String startPoint;
  @override
  final String destinationPoint;
  @override
  final String? startName;
  @override
  final String? destinationName;
  final List<String>? _criteria;
  @override
  List<String>? get criteria {
    final value = _criteria;
    if (value == null) return null;
    if (_criteria is EqualUnmodifiableListView) return _criteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _members;
  @override
  List<String>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? expectedTotalCharge;
  @override
  final String? departure;
  @override
  final String? destination;

  @override
  String toString() {
    return 'AutoMatchingRequest(startPoint: $startPoint, destinationPoint: $destinationPoint, startName: $startName, destinationName: $destinationName, criteria: $criteria, members: $members, expectedTotalCharge: $expectedTotalCharge, departure: $departure, destination: $destination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoMatchingRequestImpl &&
            (identical(other.startPoint, startPoint) ||
                other.startPoint == startPoint) &&
            (identical(other.destinationPoint, destinationPoint) ||
                other.destinationPoint == destinationPoint) &&
            (identical(other.startName, startName) ||
                other.startName == startName) &&
            (identical(other.destinationName, destinationName) ||
                other.destinationName == destinationName) &&
            const DeepCollectionEquality().equals(other._criteria, _criteria) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.expectedTotalCharge, expectedTotalCharge) ||
                other.expectedTotalCharge == expectedTotalCharge) &&
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      startPoint,
      destinationPoint,
      startName,
      destinationName,
      const DeepCollectionEquality().hash(_criteria),
      const DeepCollectionEquality().hash(_members),
      expectedTotalCharge,
      departure,
      destination);

  /// Create a copy of AutoMatchingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoMatchingRequestImplCopyWith<_$AutoMatchingRequestImpl> get copyWith =>
      __$$AutoMatchingRequestImplCopyWithImpl<_$AutoMatchingRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutoMatchingRequestImplToJson(
      this,
    );
  }
}

abstract class _AutoMatchingRequest implements AutoMatchingRequest {
  const factory _AutoMatchingRequest(
      {required final String startPoint,
      required final String destinationPoint,
      final String? startName,
      final String? destinationName,
      final List<String>? criteria,
      final List<String>? members,
      final int? expectedTotalCharge,
      final String? departure,
      final String? destination}) = _$AutoMatchingRequestImpl;

  factory _AutoMatchingRequest.fromJson(Map<String, dynamic> json) =
      _$AutoMatchingRequestImpl.fromJson;

  @override
  String get startPoint;
  @override
  String get destinationPoint;
  @override
  String? get startName;
  @override
  String? get destinationName;
  @override
  List<String>? get criteria;
  @override
  List<String>? get members;
  @override
  int? get expectedTotalCharge;
  @override
  String? get departure;
  @override
  String? get destination;

  /// Create a copy of AutoMatchingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoMatchingRequestImplCopyWith<_$AutoMatchingRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
