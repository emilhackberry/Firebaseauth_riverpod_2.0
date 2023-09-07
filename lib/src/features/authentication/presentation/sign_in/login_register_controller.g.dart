// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_register_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginPageControllerHash() =>
    r'f716fa8dc2bc15853ea66041529d5ae93c82a8ad';

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

abstract class _$LoginPageController
    extends BuildlessAutoDisposeNotifier<LoginState> {
  late final FirebaseAuthRepository firebaseAuthRepo;

  LoginState build(
    FirebaseAuthRepository firebaseAuthRepo,
  );
}

/// See also [LoginPageController].
@ProviderFor(LoginPageController)
const loginPageControllerProvider = LoginPageControllerFamily();

/// See also [LoginPageController].
class LoginPageControllerFamily extends Family<LoginState> {
  /// See also [LoginPageController].
  const LoginPageControllerFamily();

  /// See also [LoginPageController].
  LoginPageControllerProvider call(
    FirebaseAuthRepository firebaseAuthRepo,
  ) {
    return LoginPageControllerProvider(
      firebaseAuthRepo,
    );
  }

  @override
  LoginPageControllerProvider getProviderOverride(
    covariant LoginPageControllerProvider provider,
  ) {
    return call(
      provider.firebaseAuthRepo,
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
  String? get name => r'loginPageControllerProvider';
}

/// See also [LoginPageController].
class LoginPageControllerProvider
    extends AutoDisposeNotifierProviderImpl<LoginPageController, LoginState> {
  /// See also [LoginPageController].
  LoginPageControllerProvider(
    FirebaseAuthRepository firebaseAuthRepo,
  ) : this._internal(
          () => LoginPageController()..firebaseAuthRepo = firebaseAuthRepo,
          from: loginPageControllerProvider,
          name: r'loginPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginPageControllerHash,
          dependencies: LoginPageControllerFamily._dependencies,
          allTransitiveDependencies:
              LoginPageControllerFamily._allTransitiveDependencies,
          firebaseAuthRepo: firebaseAuthRepo,
        );

  LoginPageControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.firebaseAuthRepo,
  }) : super.internal();

  final FirebaseAuthRepository firebaseAuthRepo;

  @override
  LoginState runNotifierBuild(
    covariant LoginPageController notifier,
  ) {
    return notifier.build(
      firebaseAuthRepo,
    );
  }

  @override
  Override overrideWith(LoginPageController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LoginPageControllerProvider._internal(
        () => create()..firebaseAuthRepo = firebaseAuthRepo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        firebaseAuthRepo: firebaseAuthRepo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<LoginPageController, LoginState>
      createElement() {
    return _LoginPageControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginPageControllerProvider &&
        other.firebaseAuthRepo == firebaseAuthRepo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, firebaseAuthRepo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginPageControllerRef on AutoDisposeNotifierProviderRef<LoginState> {
  /// The parameter `firebaseAuthRepo` of this provider.
  FirebaseAuthRepository get firebaseAuthRepo;
}

class _LoginPageControllerProviderElement
    extends AutoDisposeNotifierProviderElement<LoginPageController, LoginState>
    with LoginPageControllerRef {
  _LoginPageControllerProviderElement(super.provider);

  @override
  FirebaseAuthRepository get firebaseAuthRepo =>
      (origin as LoginPageControllerProvider).firebaseAuthRepo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
