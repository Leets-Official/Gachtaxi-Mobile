// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMessageResponse _$ChatMessageResponseFromJson(Map<String, dynamic> json) {
  return _ChatMessageResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageResponse {
  int get memberId => throw _privateConstructorUsedError;
  DateTime? get disconnectedAt => throw _privateConstructorUsedError;
  List<ChatMessageModel> get chattingMessage =>
      throw _privateConstructorUsedError;
  Pageable get pageable => throw _privateConstructorUsedError;

  /// Serializes this ChatMessageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageResponseCopyWith<ChatMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageResponseCopyWith<$Res> {
  factory $ChatMessageResponseCopyWith(
          ChatMessageResponse value, $Res Function(ChatMessageResponse) then) =
      _$ChatMessageResponseCopyWithImpl<$Res, ChatMessageResponse>;
  @useResult
  $Res call(
      {int memberId,
      DateTime? disconnectedAt,
      List<ChatMessageModel> chattingMessage,
      Pageable pageable});

  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class _$ChatMessageResponseCopyWithImpl<$Res, $Val extends ChatMessageResponse>
    implements $ChatMessageResponseCopyWith<$Res> {
  _$ChatMessageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? disconnectedAt = freezed,
    Object? chattingMessage = null,
    Object? pageable = null,
  }) {
    return _then(_value.copyWith(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      disconnectedAt: freezed == disconnectedAt
          ? _value.disconnectedAt
          : disconnectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      chattingMessage: null == chattingMessage
          ? _value.chattingMessage
          : chattingMessage // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageModel>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ) as $Val);
  }

  /// Create a copy of ChatMessageResponse
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
abstract class _$$ChatMessageResponseImplCopyWith<$Res>
    implements $ChatMessageResponseCopyWith<$Res> {
  factory _$$ChatMessageResponseImplCopyWith(_$ChatMessageResponseImpl value,
          $Res Function(_$ChatMessageResponseImpl) then) =
      __$$ChatMessageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int memberId,
      DateTime? disconnectedAt,
      List<ChatMessageModel> chattingMessage,
      Pageable pageable});

  @override
  $PageableCopyWith<$Res> get pageable;
}

/// @nodoc
class __$$ChatMessageResponseImplCopyWithImpl<$Res>
    extends _$ChatMessageResponseCopyWithImpl<$Res, _$ChatMessageResponseImpl>
    implements _$$ChatMessageResponseImplCopyWith<$Res> {
  __$$ChatMessageResponseImplCopyWithImpl(_$ChatMessageResponseImpl _value,
      $Res Function(_$ChatMessageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? disconnectedAt = freezed,
    Object? chattingMessage = null,
    Object? pageable = null,
  }) {
    return _then(_$ChatMessageResponseImpl(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      disconnectedAt: freezed == disconnectedAt
          ? _value.disconnectedAt
          : disconnectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      chattingMessage: null == chattingMessage
          ? _value._chattingMessage
          : chattingMessage // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageModel>,
      pageable: null == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageResponseImpl implements _ChatMessageResponse {
  const _$ChatMessageResponseImpl(
      {required this.memberId,
      this.disconnectedAt,
      required final List<ChatMessageModel> chattingMessage,
      required this.pageable})
      : _chattingMessage = chattingMessage;

  factory _$ChatMessageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageResponseImplFromJson(json);

  @override
  final int memberId;
  @override
  final DateTime? disconnectedAt;
  final List<ChatMessageModel> _chattingMessage;
  @override
  List<ChatMessageModel> get chattingMessage {
    if (_chattingMessage is EqualUnmodifiableListView) return _chattingMessage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chattingMessage);
  }

  @override
  final Pageable pageable;

  @override
  String toString() {
    return 'ChatMessageResponse(memberId: $memberId, disconnectedAt: $disconnectedAt, chattingMessage: $chattingMessage, pageable: $pageable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageResponseImpl &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.disconnectedAt, disconnectedAt) ||
                other.disconnectedAt == disconnectedAt) &&
            const DeepCollectionEquality()
                .equals(other._chattingMessage, _chattingMessage) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, memberId, disconnectedAt,
      const DeepCollectionEquality().hash(_chattingMessage), pageable);

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageResponseImplCopyWith<_$ChatMessageResponseImpl> get copyWith =>
      __$$ChatMessageResponseImplCopyWithImpl<_$ChatMessageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatMessageResponse implements ChatMessageResponse {
  const factory _ChatMessageResponse(
      {required final int memberId,
      final DateTime? disconnectedAt,
      required final List<ChatMessageModel> chattingMessage,
      required final Pageable pageable}) = _$ChatMessageResponseImpl;

  factory _ChatMessageResponse.fromJson(Map<String, dynamic> json) =
      _$ChatMessageResponseImpl.fromJson;

  @override
  int get memberId;
  @override
  DateTime? get disconnectedAt;
  @override
  List<ChatMessageModel> get chattingMessage;
  @override
  Pageable get pageable;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageResponseImplCopyWith<_$ChatMessageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
