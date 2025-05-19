import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_remote_datasource.dart';
import 'service/user_profile_service.dart';

// Репозиторий с поддержкой разных платформ
class AuthRepositoryImpl {
  late final AuthRemoteDataSource _remoteDataSource;
  final SecureStorage _storage;
  final UserService _userService;

  AuthRepositoryImpl({
    required SecureStorage storage,
    bool isMobile = false,
  })  : _storage = storage,
        _userService = UserService(storage) {
    _remoteDataSource = isMobile
        ? MobileAuthRemoteDataSource()
        : UniversalAuthRemoteDataSource();
  }

  Future<void> persistTokens(oauth2.Client client) async {
    debugPrint('[DEBUG] Persisting tokens...');

    await _storage.write(
      key: 'access_token',
      value: client.credentials.accessToken,
    );
    debugPrint('[DEBUG] Access Token: ${client.credentials.accessToken}');

    await _storage.write(
      key: 'refresh_token',
      value: client.credentials.refreshToken,
    );
    debugPrint('[DEBUG] Refresh Token: ${client.credentials.refreshToken}');

    await _storage.write(
      key: 'id_token',
      value: client.credentials.idToken,
    );
    debugPrint('[DEBUG] ID Token: ${client.credentials.idToken}');

    debugPrint('[DEBUG] Tokens persisted successfully');
  }

  Future<oauth2.Client> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) {
      throw Exception('No refresh token available');
    }
    final client = await _remoteDataSource.refreshToken(refreshToken!);
    await persistTokens(client);
    return client;
  }

  Future<oauth2.Client> login() async {
    final client = await _remoteDataSource.login();
    await persistTokens(client);
    return client;
  }

  Future<void> logout() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
    await _storage.delete(key: 'id_token');
  }

  // Добавьте новые методы
  Future<UserProfile?> getCurrentUser() => _userService.getUserProfile();
  Future<String?> getCurrentUserName() => _userService.getUserName();

  // Future<String?> getAccessToken() => _storage.read(key: 'access_token');
  Future<String> getAccessToken() async {
    // Возвращает String, а не String?
    final token = await _storage.read(key: 'access_token');
    if (token == null) {
      debugPrint('Access token is null');
      throw Exception(
          'No access token available'); // Бросаем исключение вместо возврата null
    }
    return token;
    // return token ?? '';
  }

  Future<String?> getRefreshToken() => _storage.read(key: 'refresh_token');
  Future<String?> getIdToken() => _storage.read(key: 'id_token');
}

// Абстракция для хранилища
abstract class SecureStorage {
  Future<void> write({required String key, required String? value});
  Future<String?> read({required String key});
  Future<void> delete({required String key});
}

// Реализация для мобильных/десктоп платформ
class MobileSecureStorage implements SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> write({required String key, required String? value}) =>
      _storage.write(key: key, value: value);

  @override
  Future<String?> read({required String key}) => _storage.read(key: key);

  @override
  Future<void> delete({required String key}) => _storage.delete(key: key);
}

// Реализация для Web
class WebSecureStorage implements SecureStorage {
  final SharedPreferences _prefs;

  WebSecureStorage(this._prefs);

  @override
  Future<void> write({required String key, required String? value}) async {
    if (value != null) {
      await _prefs.setString(key, value);
    } else {
      await delete(key: key);
    }
  }

  @override
  Future<String?> read({required String key}) =>
      Future.value(_prefs.getString(key));

  @override
  Future<void> delete({required String key}) => _prefs.remove(key);
}



// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'auth_remote_datasource.dart';
// import 'package:flutter_appauth/flutter_appauth.dart';

// class AuthRepositoryImpl {
//   final FlutterSecureStorage _secureStorage;
//   final AuthRemoteDataSource _remoteDataSource = AuthRemoteDataSource();

//   AuthRepositoryImpl({required FlutterSecureStorage secureStorage})
//       : _secureStorage = secureStorage;

//   Future<void> persistTokens(TokenResponse response) async {
//     await _secureStorage.write(
//       key: 'access_token', 
//       value: response.accessToken
//     );
//     await _secureStorage.write(
//       key: 'refresh_token', 
//       value: response.refreshToken
//     );
//   }

//   Future<String?> getAccessToken() async {
//     return await _secureStorage.read(key: 'access_token');
//   }

//   Future<String> refreshToken() async {
//     final refreshToken = await _secureStorage.read(key: 'refresh_token');
//     final response = await _remoteDataSource.refreshToken(refreshToken!);
//     await persistTokens(response);
//     return response.accessToken!;
//   }
//   Future<AuthorizationTokenResponse> login() async {
//     final tokens = await _remoteDataSource.login();
//     persistTokens(tokens);
//     return tokens;
//   }
//   Future<void> logout() async {
//     await _secureStorage.delete(key: 'access_token');
//     await _secureStorage.delete(key: 'refresh_token');
//   }
// }