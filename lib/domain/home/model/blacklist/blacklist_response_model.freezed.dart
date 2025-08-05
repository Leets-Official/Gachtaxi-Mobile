// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blacklist_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlacklistResponse _$BlacklistResponseFromJson(Map<String, dynamic> json) {
  return _BlacklistResponse.fromJson(json);
}

/// @nodoc
mixin _$BlacklistResponse {
  List<Blacklist> get blacklist => throw _privateConstructorUsedError;
  Pageable get pageable => throw _privateConstructorUsedError;

  /// Serializes this BlacklistResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlacklistResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlacklistResponseCopyWith<BlacklistResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlacklistResponseCopyWith<$Res> {
  factory $BlacklistResponseCopyWith(
          BlacklistResponse value, $Res Function(BlacklistResponse) then) =
      _$BlacklistResponseCopyWithImpl<$Res, BlacklistResponse>;
  @useResult
  $Res call({List<Blacklist> blacklist, Pageable pageable});

  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class _$BlacklistResponseCopyWithImpl<$Res, $Val extends BlacklistResponse>
    implements $BlacklistResponseCopyWith<$Res> {
  _$BlacklistResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlacklistResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blacklist = null,
    Object? pageable = null,
  }) {
    return _then(_value.copyWith(
      blacklist: null == blacklist
          ? _value.blacklist
          : blacklist // ignore: cast_nullable_to_non_nullable
              as List<Blacklist>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ) as $Val);
  }

  /// Create a copy of BlacklistResponse
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
abstract class _$$BlacklistResponseImplCopyWith<$Res>
    implements $BlacklistResponseCopyWith<$Res> {
  factory _$$BlacklistResponseImplCopyWith(_$BlacklistResponseImpl value,
          $Res Function(_$BlacklistResponseImpl) then) =
      __$$BlacklistResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Blacklist> blacklist, Pageable pageable});

  @override
  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class __$$BlacklistResponseImplCopyWithImpl<$Res>
    extends _$BlacklistResponseCopyWithImpl<$Res, _$BlacklistResponseImpl>
    implements _$$BlacklistResponseImplCopyWith<$Res> {
  __$$BlacklistResponseImplCopyWithImpl(_$BlacklistResponseImpl _value,
      $Res Function(_$BlacklistResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlacklistResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blacklist = null,
    Object? pageable = null,
  }) {
    return _then(_$BlacklistResponseImpl(
      blacklist: null == blacklist
          ? _value._blacklist
          : blacklist // ignore: cast_nullable_to_non_nullable
              as List<Blacklist>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlacklistResponseImpl implements _BlacklistResponse {
  const _$BlacklistResponseImpl(
      {required final List<Blacklist> blacklist, required this.pageable})
      : _blacklist = blacklist;

  factory _$BlacklistResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlacklistResponseImplFromJson(json);

  final List<Blacklist> _blacklist;
  @override
  List<Blacklist> get blacklist {
    if (_blacklist is EqualUnmodifiableListView) return _blacklist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blacklist);
  }

  @override
  final Pageable pageable;

  @override
  String toString() {
    return 'BlacklistResponse(blacklist: $blacklist, pageable: $pageable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlacklistResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._blacklist, _blacklist) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_blacklist), pageable);

  /// Create a copy of BlacklistResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlacklistResponseImplCopyWith<_$BlacklistResponseImpl> get copyWith =>
      __$$BlacklistResponseImplCopyWithImpl<_$BlacklistResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlacklistResponseImplToJson(
      this,
    );
  }
}

abstract class _BlacklistResponse implements BlacklistResponse {
  const factory _BlacklistResponse(
      {required final List<Blacklist> blacklist,
      required final Pageable pageable}) = _$BlacklistResponseImpl;

  factory _BlacklistResponse.fromJson(Map<String, dynamic> json) =
      _$BlacklistResponseImpl.fromJson;

  @override
  List<Blacklist> get blacklist;
  @override
  Pageable get pageable;

  /// Create a copy of BlacklistResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlacklistResponseImplCopyWith<_$BlacklistResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
