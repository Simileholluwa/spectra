import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

part 'server_provider.g.dart';

@riverpod
Client client(Ref ref) {
  return Client(
    Env.apiBaseUrl,
    connectionTimeout: const Duration(
      seconds: 120,
    ),
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
}

@riverpod
Raw<SessionManager> session(Ref ref) {
  return SessionManager(
    caller: ref.watch(clientProvider).modules.auth,
  );
}

@riverpod
EmailAuthController authEmail(Ref ref) {
  return EmailAuthController(
    ref.watch(clientProvider).modules.auth,
  );
}