// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noticeDataNotifierHash() =>
    r'4c5435bc9872f7fe6ed9b8ae84a8b598419ac374';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$NoticeDataNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse<Notice>> {
  late final int noticeId;

  FutureOr<ApiResponse<Notice>> build(
    int noticeId,
  );
}

/// See also [NoticeDataNotifier].
@ProviderFor(NoticeDataNotifier)
const noticeDataNotifierProvider = NoticeDataNotifierFamily();

/// See also [NoticeDataNotifier].
class NoticeDataNotifierFamily extends Family<AsyncValue<ApiResponse<Notice>>> {
  /// See also [NoticeDataNotifier].
  const NoticeDataNotifierFamily();

  /// See also [NoticeDataNotifier].
  NoticeDataNotifierProvider call(
    int noticeId,
  ) {
    return NoticeDataNotifierProvider(
      noticeId,
    );
  }

  @override
  NoticeDataNotifierProvider getProviderOverride(
    covariant NoticeDataNotifierProvider provider,
  ) {
    return call(
      provider.noticeId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'noticeDataNotifierProvider';
}

/// See also [NoticeDataNotifier].
class NoticeDataNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    NoticeDataNotifier, ApiResponse<Notice>> {
  /// See also [NoticeDataNotifier].
  NoticeDataNotifierProvider(
    int noticeId,
  ) : this._internal(
          () => NoticeDataNotifier()..noticeId = noticeId,
          from: noticeDataNotifierProvider,
          name: r'noticeDataNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$noticeDataNotifierHash,
          dependencies: NoticeDataNotifierFamily._dependencies,
          allTransitiveDependencies:
              NoticeDataNotifierFamily._allTransitiveDependencies,
          noticeId: noticeId,
        );

  NoticeDataNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.noticeId,
  }) : super.internal();

  final int noticeId;

  @override
  FutureOr<ApiResponse<Notice>> runNotifierBuild(
    covariant NoticeDataNotifier notifier,
  ) {
    return notifier.build(
      noticeId,
    );
  }

  @override
  Override overrideWith(NoticeDataNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: NoticeDataNotifierProvider._internal(
        () => create()..noticeId = noticeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        noticeId: noticeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<NoticeDataNotifier,
      ApiResponse<Notice>> createElement() {
    return _NoticeDataNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NoticeDataNotifierProvider && other.noticeId == noticeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, noticeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NoticeDataNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<ApiResponse<Notice>> {
  /// The parameter `noticeId` of this provider.
  int get noticeId;
}

class _NoticeDataNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NoticeDataNotifier,
        ApiResponse<Notice>> with NoticeDataNotifierRef {
  _NoticeDataNotifierProviderElement(super.provider);

  @override
  int get noticeId => (origin as NoticeDataNotifierProvider).noticeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
