// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_matching_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchingDataNotifierHash() =>
    r'eb08a7a434a19a5304717908cb7eaab3ee8c3da2';

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

abstract class _$MatchingDataNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse<MatchingData>> {
  late final MatchingCategory type;

  FutureOr<ApiResponse<MatchingData>> build(
    MatchingCategory type,
  );
}

/// See also [MatchingDataNotifier].
@ProviderFor(MatchingDataNotifier)
const matchingDataNotifierProvider = MatchingDataNotifierFamily();

/// See also [MatchingDataNotifier].
class MatchingDataNotifierFamily
    extends Family<AsyncValue<ApiResponse<MatchingData>>> {
  /// See also [MatchingDataNotifier].
  const MatchingDataNotifierFamily();

  /// See also [MatchingDataNotifier].
  MatchingDataNotifierProvider call(
    MatchingCategory type,
  ) {
    return MatchingDataNotifierProvider(
      type,
    );
  }

  @override
  MatchingDataNotifierProvider getProviderOverride(
    covariant MatchingDataNotifierProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'matchingDataNotifierProvider';
}

/// See also [MatchingDataNotifier].
class MatchingDataNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MatchingDataNotifier, ApiResponse<MatchingData>> {
  /// See also [MatchingDataNotifier].
  MatchingDataNotifierProvider(
    MatchingCategory type,
  ) : this._internal(
          () => MatchingDataNotifier()..type = type,
          from: matchingDataNotifierProvider,
          name: r'matchingDataNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$matchingDataNotifierHash,
          dependencies: MatchingDataNotifierFamily._dependencies,
          allTransitiveDependencies:
              MatchingDataNotifierFamily._allTransitiveDependencies,
          type: type,
        );

  MatchingDataNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final MatchingCategory type;

  @override
  FutureOr<ApiResponse<MatchingData>> runNotifierBuild(
    covariant MatchingDataNotifier notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(MatchingDataNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: MatchingDataNotifierProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MatchingDataNotifier,
      ApiResponse<MatchingData>> createElement() {
    return _MatchingDataNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchingDataNotifierProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MatchingDataNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<ApiResponse<MatchingData>> {
  /// The parameter `type` of this provider.
  MatchingCategory get type;
}

class _MatchingDataNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MatchingDataNotifier,
        ApiResponse<MatchingData>> with MatchingDataNotifierRef {
  _MatchingDataNotifierProviderElement(super.provider);

  @override
  MatchingCategory get type => (origin as MatchingDataNotifierProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
