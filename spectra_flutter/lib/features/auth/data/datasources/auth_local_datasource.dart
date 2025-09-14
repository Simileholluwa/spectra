import 'dart:convert';
import 'dart:developer';

import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';

abstract class AuthLocalDatasource {
  Future<void> saveUser({required User user});
  User? getUser();
  Future<void> removeUser();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final LocalStorage _prefs;
  AuthLocalDatasourceImpl({
    required LocalStorage prefs,
  }) : _prefs = prefs;

  @override
  Future<void> saveUser({
    required User user,
  }) async {
    try {
      final jsonString = jsonEncode(user);
      await _prefs.setString('user', jsonString);
      await _prefs.setInt(
        'userId',
        user.id!,
      );
    } catch (e) {
      log(e.toString());
      throw CacheException(message: 'Something went wrong');
    }
  }

  @override
  User? getUser() {
    final user = _prefs.getString('user');
    try {
      if (user != null) {
        final decoded = jsonDecode(user.toString());
        return User.fromJson(decoded);
      } else {
        return null;
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> removeUser() {
    return _prefs.remove('User');
  }
}
