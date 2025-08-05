// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendResponse _$FriendResponseFromJson(Map<String, dynamic> json) {
  return _FriendResponse.fromJson(json);
}

/// @nodoc
mixin _$FriendResponse {
  List<Friend> get response => throw _privateConstructorUsedError;
  Pageable get pageable => throw _privateConstructorUsedError;

  /// Serializes this FriendResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FriendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FriendResponseCopyWith<FriendResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendResponseCopyWith<$Res> {
  factory $FriendResponseCopyWith(
          FriendResponse value, $Res Function(FriendResponse) then) =
      _$FriendResponseCopyWithImpl<$Res, FriendResponse>;
  @useResult
  $Res call({List<Friend> response, Pageable pageable});

  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class _$FriendResponseCopyWithImpl<$Res, $Val extends FriendResponse>
    implements $FriendResponseCopyWith<$Res> {
  _$FriendResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FriendResponse
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
              as List<Friend>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ) as $Val);
  }

  /// Create a copy of FriendResponse
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
abstract class _$$FriendResponseImplCopyWith<$Res>
    implements $FriendResponseCopyWith<$Res> {
  factory _$$FriendResponseImplCopyWith(_$FriendResponseImpl value,
          $Res Function(_$FriendResponseImpl) then) =
      __$$FriendResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Friend> response, Pageable pageable});

  @override
  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class __$$FriendResponseImplCopyWithImpl<$Res>
    extends _$FriendResponseCopyWithImpl<$Res, _$FriendResponseImpl>
    implements _$$FriendResponseImplCopyWith<$Res> {
  __$$FriendResponseImplCopyWithImpl(
      _$FriendResponseImpl _value, $Res Function(_$FriendResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FriendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? pageable = null,
  }) {
    return _then(_$FriendResponseImpl(
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<Friend>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendResponseImpl implements _FriendResponse {
  const _$FriendResponseImpl(
      {required final List<Friend> response, required this.pageable})
      : _response = response;

  factory _$FriendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendResponseImplFromJson(json);

  final List<Friend> _response;
  @override
  List<Friend> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  final Pageable pageable;

  @override
  String toString() {
    return 'FriendResponse(response: $response, pageable: $pageable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendResponseImpl &&
            const DeepCollectionEquality().equals(other._response, _response) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_response), pageable);

  /// Create a copy of FriendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendResponseImplCopyWith<_$FriendResponseImpl> get copyWith =>
      __$$FriendResponseImplCopyWithImpl<_$FriendResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendResponseImplToJson(
      this,
    );
  }
}

abstract class _FriendResponse implements FriendResponse {
  const factory _FriendResponse(
      {required final List<Friend> response,
      required final Pageable pageable}) = _$FriendResponseImpl;

  factory _FriendResponse.fromJson(Map<String, dynamic> json) =
      _$FriendResponseImpl.fromJson;

  @override
  List<Friend> get response;
  @override
  Pageable get pageable;

  /// Create a copy of FriendResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendResponseImplCopyWith<_$FriendResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
