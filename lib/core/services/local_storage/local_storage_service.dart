// ignore_for_file: constant_identifier_names, empty_catches

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class LocalStorageKeys {
  static const authTokenKey = 'token';
  static const userIdKey = 'user_id';
  static const userKey = 'user';
  static const userEmailKey = 'user_email';
  static const buildUpdateSeenKey = 'build_update_seen';
}

abstract class LocalStorageService {
  Future saveBool(String key, bool value);
  Future saveString(String key, String value);
  Future saveDouble(String key, num value);

  Future<bool?> fetchBool(String key);
  Future<String?> fetchString(String key);
  Future<double?> fetchDouble(String key);

  Future<bool> containsKey(String key);
  Future<List<String>> fetchKeys();

  Future<bool> clearEntireStorage();
  Future<bool> clearField(String key);
}

@LazySingleton(as: LocalStorageService)
class FlutterSecureStorageService implements LocalStorageService {
  final FlutterSecureStorage _secureStorage;

  FlutterSecureStorageService({FlutterSecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? const FlutterSecureStorage();
  @override
  Future<bool> clearEntireStorage() async {
    await _secureStorage.deleteAll();
    return true;
  }

  @override
  Future<bool> clearField(String key) async {
    try {
      _secureStorage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool?> fetchBool(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      if (value == null) return null;
      return value == 'true';
    } catch (e) {
      return null;
    }
  }

  @override
  Future<double?> fetchDouble(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      return value == null ? null : double.tryParse(value);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> fetchString(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      return value;
    } catch (e) {
      return null;
    }
  }

  @override
  Future saveBool(String key, bool value) async {
    try {
      await _secureStorage.write(key: key, value: value.toString());
    } catch (e) {}
  }

  @override
  Future saveDouble(String key, num value) async {
    try {
      await _secureStorage.write(key: key, value: value.toString());
    } catch (e) {}
  }

  @override
  Future saveString(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {}
  }

  @override
  Future<bool> containsKey(String key) async {
    try {
      final value = await _secureStorage.containsKey(key: key);
      return value;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<String>> fetchKeys() {
    throw UnimplementedError();
  }
}

class SharedPreferenceLocalStorage implements LocalStorageService {
  final SharedPreferences sharedPreferences;

  SharedPreferenceLocalStorage({required this.sharedPreferences});

  @override
  Future saveBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  @override
  Future saveString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  Future saveDouble(String key, num value) {
    return sharedPreferences.setDouble(key, value.toDouble());
  }

  @override
  Future<bool?> fetchBool(String key) async {
    return sharedPreferences.getBool(key);
  }

  @override
  Future<String?> fetchString(String key) async {
    return sharedPreferences.getString(key);
  }

  @override
  Future<double?> fetchDouble(String key) async {
    return sharedPreferences.getDouble(key);
  }

  @override
  Future<bool> clearEntireStorage() async {
    return sharedPreferences.clear();
  }

  @override
  Future<bool> clearField(String key) {
    try {
      return sharedPreferences.remove(key);
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    return sharedPreferences.containsKey(key);
  }

  @override
  Future<List<String>> fetchKeys() async {
    return sharedPreferences.getKeys().toList();
  }
}
