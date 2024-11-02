// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saveBookingNotifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookingSaveNotifierHash() =>
    r'98d49dee51a51398bd2b54c843200b76ef2ab3ef';

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

/// See also [BookingSaveNotifier].
@ProviderFor(BookingSaveNotifier)
const bookingSaveNotifierProvider = BookingSaveNotifierFamily();

/// See also [BookingSaveNotifier].
class BookingSaveNotifierFamily extends Family<AsyncValue<bool>> {
  /// See also [BookingSaveNotifier].
  const BookingSaveNotifierFamily();

  /// See also [BookingSaveNotifier].
  BookingSaveNotifierProvider call({
    required String email,
    required List<YogaClassCombinedviewModel> YogaClassIds,
  }) {
    return BookingSaveNotifierProvider(
      email: email,
      YogaClassIds: YogaClassIds,
    );
  }

  @override
  BookingSaveNotifierProvider getProviderOverride(
    covariant BookingSaveNotifierProvider provider,
  ) {
    return call(
      email: provider.email,
      YogaClassIds: provider.YogaClassIds,
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
  String? get name => r'bookingSaveNotifierProvider';
}

/// See also [BookingSaveNotifier].
class BookingSaveNotifierProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [BookingSaveNotifier].
  BookingSaveNotifierProvider({
    required String email,
    required List<YogaClassCombinedviewModel> YogaClassIds,
  }) : this._internal(
          (ref) => BookingSaveNotifier(
            ref as BookingSaveNotifierRef,
            email: email,
            YogaClassIds: YogaClassIds,
          ),
          from: bookingSaveNotifierProvider,
          name: r'bookingSaveNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookingSaveNotifierHash,
          dependencies: BookingSaveNotifierFamily._dependencies,
          allTransitiveDependencies:
              BookingSaveNotifierFamily._allTransitiveDependencies,
          email: email,
          YogaClassIds: YogaClassIds,
        );

  BookingSaveNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.YogaClassIds,
  }) : super.internal();

  final String email;
  final List<YogaClassCombinedviewModel> YogaClassIds;

  @override
  Override overrideWith(
    FutureOr<bool> Function(BookingSaveNotifierRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BookingSaveNotifierProvider._internal(
        (ref) => create(ref as BookingSaveNotifierRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        YogaClassIds: YogaClassIds,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _BookingSaveNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookingSaveNotifierProvider &&
        other.email == email &&
        other.YogaClassIds == YogaClassIds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, YogaClassIds.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BookingSaveNotifierRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `YogaClassIds` of this provider.
  List<YogaClassCombinedviewModel> get YogaClassIds;
}

class _BookingSaveNotifierProviderElement
    extends AutoDisposeFutureProviderElement<bool> with BookingSaveNotifierRef {
  _BookingSaveNotifierProviderElement(super.provider);

  @override
  String get email => (origin as BookingSaveNotifierProvider).email;
  @override
  List<YogaClassCombinedviewModel> get YogaClassIds =>
      (origin as BookingSaveNotifierProvider).YogaClassIds;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
