// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clientHash() => r'bd9a32edfc307f7afcc0e91a81b013ee889cb12d';

/// See also [client].
@ProviderFor(client)
final clientProvider = AutoDisposeProvider<Client>.internal(
  client,
  name: r'clientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ClientRef = AutoDisposeProviderRef<Client>;
String _$sessionHash() => r'd689cd564212758e004169902bf29bf770788f2e';

/// See also [session].
@ProviderFor(session)
final sessionProvider = AutoDisposeProvider<Raw<SessionManager>>.internal(
  session,
  name: r'sessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SessionRef = AutoDisposeProviderRef<Raw<SessionManager>>;
String _$authEmailHash() => r'00e904c27e409a91c6d612430f2322918674af30';

/// See also [authEmail].
@ProviderFor(authEmail)
final authEmailProvider = AutoDisposeProvider<EmailAuthController>.internal(
  authEmail,
  name: r'authEmailProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authEmailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthEmailRef = AutoDisposeProviderRef<EmailAuthController>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
