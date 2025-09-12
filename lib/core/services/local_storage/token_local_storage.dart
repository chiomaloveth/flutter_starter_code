

import 'package:injectable/injectable.dart';
import 'package:nova/core/services/local_storage/local_storage_service.dart';

@lazySingleton
class TokenLocalStorage {
  final LocalStorageService _localStorageService;

  TokenLocalStorage({@ignoreParam LocalStorageService? localStorageService})
    : _localStorageService = localStorageService ?? FlutterSecureStorageService();

  final accessTokenKey = 'token';
  final refreshTokenKey = 'refresh_token';
  final tokenExpiryKey = 'token_expiry';

  Future<void> storeToken({required String token, required String refreshToken}) async {
    final expiryDate = DateTime.now().add(const Duration(days: 30));
    await Future.wait([
      _localStorageService.saveString(accessTokenKey, token),
      _localStorageService.saveString(refreshTokenKey, refreshToken),
      _localStorageService.saveString(tokenExpiryKey, expiryDate.toIso8601String()),
    ]);
  }

  Future<void> updateAccessToken(String token) async {
    await _localStorageService.saveString(accessTokenKey, token);
  }

  Future<String?> getAccessToken() async {
    final token = await _localStorageService.fetchString(accessTokenKey);
    final expiryDateString = await _localStorageService.fetchString(tokenExpiryKey);

    if (token == null || expiryDateString == null) {
      return null;
    }

    final expiryDate = DateTime.tryParse(expiryDateString);
    if (expiryDate == null || DateTime.now().isAfter(expiryDate)) {
      await deleteToken();
      return null;
    }

    return token;
  }

  Future<String?> getRefreshToken() async {
    final token = await _localStorageService.fetchString(refreshTokenKey);
    final expiryDateString = await _localStorageService.fetchString(tokenExpiryKey);

    if (token == null || expiryDateString == null) {
      return null;
    }

    final expiryDate = DateTime.tryParse(expiryDateString);
    if (expiryDate == null || DateTime.now().isAfter(expiryDate)) {
      await deleteToken();
      return null;
    }

    return token;
  }

  Future<void> deleteToken() async {
    await Future.wait([
      _localStorageService.clearField(accessTokenKey),
      _localStorageService.clearField(tokenExpiryKey),
      _localStorageService.clearField(refreshTokenKey),
    ]);
  }
}
