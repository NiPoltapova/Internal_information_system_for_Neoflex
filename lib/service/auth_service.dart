// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_appauth/flutter_appauth.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:oauth2/oauth2.dart' as oauth2;
// import 'package:url_launcher/url_launcher.dart';

// class AuthService {
//   static const _storageKey = 'oauth_credentials';
//   final FlutterAppAuth? _appAuth;
//   final FlutterSecureStorage _secureStorage;
//   final String _clientId;
//   final String _redirectUrl;
//   final String _issuer;
//   final String _tokenEndpoint;
//   final List<String> _scopes;
//   final bool _isMobile;

//   AuthService({
//     FlutterAppAuth? appAuth,
//     required FlutterSecureStorage secureStorage,
//     required String clientId,
//     required String redirectUrl,
//     required String issuer,
//     required List<String> scopes,
//   })  : _appAuth = appAuth,
//         _secureStorage = secureStorage,
//         _clientId = clientId,
//         _redirectUrl = redirectUrl,
//         _issuer = issuer,
//         _tokenEndpoint = '$issuer/oauth2/token',
//         _scopes = scopes,
//         _isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

//   Future<oauth2.Client?> login() async {
//     try {
//       if (_isMobile && _appAuth != null) {
//         return await _mobileLogin();
//       } else {
//         return await _desktopLogin();
//       }
//     } catch (e) {
//       await _secureStorage.delete(key: _storageKey);
//       rethrow;
//     }
//   }

//   Future<oauth2.Client?> _mobileLogin() async {
//     final result = await _appAuth!.authorizeAndExchangeCode(
//       AuthorizationTokenRequest(
//         _clientId,
//         _redirectUrl,
//         issuer: _issuer,
//         scopes: _scopes,
//         additionalParameters: {'prompt': 'login'},
//       ),
//     );

//     final credentials = oauth2.Credentials(
//       result.accessToken!,
//       refreshToken: result.refreshToken,
//       tokenEndpoint: Uri.parse(_tokenEndpoint),
//       scopes: _scopes,
//     );
//     await _storeCredentials(credentials);
//     return oauth2.Client(credentials);
//       return null;
//   }

//   Future<oauth2.Client?> _desktopLogin() async {
//     final grant = oauth2.AuthorizationCodeGrant(
//       _clientId,
//       Uri.parse('$_issuer/oauth2/auth'),
//       Uri.parse(_tokenEndpoint),
//     );

//     final authUrl = grant.getAuthorizationUrl(
//       Uri.parse(_redirectUrl),
//       scopes: _scopes,
//     );

//     if (await canLaunchUrl(authUrl)) {
//       await launchUrl(authUrl);
//     }

//     final responseUrl = await _listenForRedirect();
//     final client = await grant.handleAuthorizationResponse(responseUrl.queryParameters);
//     await _storeCredentials(client.credentials);
//     return client;
//   }

//   Future<Uri> _listenForRedirect() async {
//     if (kIsWeb) {
//       // Для веба используем window.location
//       return Uri.base;
//     } else {
//       // Для десктопа создаем временный сервер
//       final server = await HttpServer.bind('localhost', 8080);
//       try {
//         final request = await server.first;
//         final uri = request.uri;
//         request.response
//           ..statusCode = 200
//           ..write('Authentication complete. You can close this window.')
//           ..close();
//         return uri;
//       } finally {
//         await server.close();
//       }
//     }
//   }

//   Future<void> _storeCredentials(oauth2.Credentials credentials) async {
//     await _secureStorage.write(
//       key: _storageKey,
//       value: jsonEncode(credentials.toJson()),
//     );
//   }

//   Future<oauth2.Client?> loadSavedClient() async {
//     final json = await _secureStorage.read(key: _storageKey);
//     if (json != null) {
//       try {
//         final credentials = oauth2.Credentials.fromJson(jsonDecode(json));
//         return oauth2.Client(credentials);
//       } catch (e) {
//         await _secureStorage.delete(key: _storageKey);
//       }
//     }
//     return null;
//   }

//   Future<void> logout() async {
//     try {
//       if (_isMobile && _appAuth != null) {
//         final idToken = await _secureStorage.read(key: 'id_token');
//         await _appAuth.endSession(EndSessionRequest(
//           idTokenHint: idToken,
//           postLogoutRedirectUrl: _redirectUrl,
//           issuer: _issuer,
//         ));
//       }
//     } finally {
//       await _secureStorage.delete(key: _storageKey);
//     }
//   }
// }




// /*import 'package:flutter_appauth/flutter_appauth.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class AuthService {
//   final FlutterAppAuth _appAuth;
//   final FlutterSecureStorage _secureStorage;
//   final String _clientId;
//   final String _redirectUrl;
//   final String _issuer;
//   final List<String> _scopes;

//   AuthService({
//     required FlutterAppAuth appAuth,
//     required FlutterSecureStorage secureStorage,
//     required String clientId,
//     required String redirectUrl,
//     required String issuer,
//     required List<String> scopes,
//   })  : _appAuth = appAuth,
//         _secureStorage = secureStorage,
//         _clientId = clientId,
//         _redirectUrl = redirectUrl,
//         _issuer = issuer,
//         _scopes = scopes;

//   Future<bool> login() async {
//     try {
//       final result = await _appAuth.authorizeAndExchangeCode(
//         AuthorizationTokenRequest(
//           _clientId,
//           _redirectUrl,
//           issuer: _issuer,
//           scopes: _scopes
//         ),
//       );

//       if (result != null) {
//         await _secureStorage.write(
//           key: 'access_token',
//           value: result.accessToken,
//         );
//         await _secureStorage.write(
//           key: 'refresh_token',
//           value: result.refreshToken,
//         );
//         await _secureStorage.write(
//           key: 'id_token',
//           value: result.idToken,
//         );
//       }
//       return true;
//     } on FlutterAppAuthUserCancelledException {
//       print('User cancelled authentication');
//       rethrow;
//       return false;
//     } catch (e) {
//       print('Authentication error: $e');
//       await _secureStorage.deleteAll();
//       rethrow;
//       return false;
//     }
//   }

//   Future<void> logout() async {
//     final idToken = await _secureStorage.read(key: 'id_token');
//     try {
//       await _appAuth.endSession(EndSessionRequest(
//         idTokenHint: idToken,
//         postLogoutRedirectUrl: _redirectUrl,
//         issuer: _issuer
//       ));
//     } finally {
//       await _secureStorage.deleteAll();
//     }
//   }

//   Future<String?> get accessToken async => 
//       await _secureStorage.read(key: 'access_token');
// }*/