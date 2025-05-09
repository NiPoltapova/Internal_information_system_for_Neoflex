import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:convert';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<oauth2.Client> login();
  Future<oauth2.Client> refreshToken(String refreshToken);
}

// Для Android/iOS с flutter_appauth
class MobileAuthRemoteDataSource implements AuthRemoteDataSource {
  static const _clientId = 'flutter-client';
  static const _clientSecret = 'your-client-secret'; // Добавьте секрет
  static const _redirectUri = 'com.example.app:/oauth2redirect';
  static const _discoveryUrl = 
    'http://localhost:9000/.well-known/openid-configuration';

  final FlutterAppAuth _appAuth = FlutterAppAuth();


@override
Future<oauth2.Client> login() async {
  final result = await _appAuth.authorizeAndExchangeCode(
    AuthorizationTokenRequest(
      _clientId,
      _redirectUri,
      discoveryUrl: _discoveryUrl,
      scopes: ['openid', 'profile', 'offline_access'],
      clientSecret: _clientSecret, // Добавьте секрет
    ),
  );
  
  return oauth2.Client(
    oauth2.Credentials(
      result.accessToken!,
      refreshToken: result.refreshToken,
      expiration: result.accessTokenExpirationDateTime,
    ),
  );
}

@override
  Future<oauth2.Client> refreshToken(String refreshToken) async {
    final result = await _appAuth.token(TokenRequest(
      _clientId,
      _redirectUri,
      refreshToken: refreshToken,
      discoveryUrl: _discoveryUrl,
      clientSecret: _clientSecret
    ));

    if (result == null) throw Exception('Refresh token failed');
    
    return oauth2.Client(
      oauth2.Credentials(
        result.accessToken!,
        refreshToken: result.refreshToken,
        idToken: result.idToken,
        expiration: result.accessTokenExpirationDateTime,
      ),
    );
  }
}

// Для Web и Desktop (Windows/Linux/MacOS)
class UniversalAuthRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio = Dio();
  static const _clientId = 'flutter-client';
  static const _clientSecret = 'your-client-secret';
  static const _redirectUri = 'http://localhost:3000/redirect';
  static const _authorizationEndpoint = 'http://localhost:9000/oauth2/authorize';
  static const _tokenEndpoint = 'http://localhost:9000/oauth2/token';

  @override
  Future<oauth2.Client> login() async {
    final grant = oauth2.AuthorizationCodeGrant(
      _clientId,
      Uri.parse(_authorizationEndpoint),
      Uri.parse(_tokenEndpoint),
      secret: _clientSecret, // Секрет добавлен здесь
    );

    final authorizationUrl = grant.getAuthorizationUrl(
      Uri.parse(_redirectUri),
      scopes: ['openid', 'profile', 'offline_access'],
    );

    await launchUrl(authorizationUrl);

    return !kIsWeb 
      ? await _listenForCode(grant)
      : await _handleWebRedirect(grant);
  }

  @override
  Future<oauth2.Client> refreshToken(String refreshToken) async {
    final response = await _dio.post(
      _tokenEndpoint,
      data: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
        'client_id': _clientId,
        'client_secret': _clientSecret, // Секрет добавлен здесь
      },
    );

    return oauth2.Client(
      oauth2.Credentials.fromJson(
        jsonEncode({
          'access_token': response.data['access_token'] as String,
          'refresh_token': response.data['refresh_token'] as String,
          'token_type': 'Bearer',
          'expires_in': response.data['expires_in'] as int,
        }),
      ),
    );
  }

    Future<oauth2.Client> _listenForCode(oauth2.AuthorizationCodeGrant grant) async {
    final server = await HttpServer.bind('localhost', 3000);
    try {
      final request = await server.first;
      final uri = request.requestedUri;
      
      request.response
        ..statusCode = 200
        ..headers.contentType = ContentType.html
        ..write('<script>window.close();</script>');
      await request.response.close();

      return grant.handleAuthorizationResponse(uri.queryParameters);
    } finally {
      await server.close();
    }
  }

  Future<oauth2.Client> _handleWebRedirect(oauth2.AuthorizationCodeGrant grant) async {
    final completer = Completer<Map<String, String>>();
    
    html.window.onMessage.listen((event) {
      if (event.origin != html.window.location.origin) return;
      
      final url = event.data as String;
      final uri = Uri.parse(url);
      completer.complete(uri.queryParameters);
    });

    final params = await completer.future;
    return grant.handleAuthorizationResponse(params);
  }
}


// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:oauth2/oauth2.dart' as oauth2;
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_appauth/flutter_appauth.dart';
// import 'package:universal_html/html.dart' as html;
// import 'dart:convert';
// import 'package:dio/dio.dart';

// abstract class AuthRemoteDataSource {
//   Future<oauth2.Client> login();
//   Future<oauth2.Client> refreshToken(String refreshToken);
// }

// // Для Android/iOS с flutter_appauth
// class MobileAuthRemoteDataSource implements AuthRemoteDataSource {
//   static const _clientId = 'flutter-client';
//   static const _redirectUri = 'com.example.app:/oauth2redirect';
//   static const _discoveryUrl = 
//     'http://localhost:9000/.well-known/openid-configuration';

//   final FlutterAppAuth _appAuth = FlutterAppAuth();

//   @override
//   Future<oauth2.Client> login() async {
//     final result = await _appAuth.authorizeAndExchangeCode(
//       AuthorizationTokenRequest(
//         _clientId,
//         _redirectUri,
//         discoveryUrl: _discoveryUrl,
//         scopes: ['openid', 'profile', 'offline_access'],
//         // PKCE включается автоматически
//       ),
//     );
    
//     return oauth2.Client(
//       oauth2.Credentials(
//         result.accessToken!,
//         refreshToken: result.refreshToken,
//         expiration: result.accessTokenExpirationDateTime,
//       ),
//     );
//   }

// @override
//   Future<oauth2.Client> refreshToken(String refreshToken) async {
//     final result = await _appAuth.token(TokenRequest(
//       _clientId,
//       _redirectUri,
//       refreshToken: refreshToken,
//       discoveryUrl: _discoveryUrl,
//     ));

//     if (result == null) throw Exception('Refresh token failed');
    
//     return oauth2.Client(
//       oauth2.Credentials(
//         result.accessToken!,
//         refreshToken: result.refreshToken,
//         idToken: result.idToken,
//         expiration: result.accessTokenExpirationDateTime,
//       ),
//     );
//   }
// }

// // Для Web и Desktop (Windows/Linux/MacOS)
// class UniversalAuthRemoteDataSource implements AuthRemoteDataSource {
//   final Dio _dio = Dio();
//   static const _clientId = 'flutter-client';
//   static const _redirectUri = 'http://localhost:3000/redirect';
//   static const _authorizationEndpoint = 
//     'http://localhost:9000/oauth2/authorize';
//   static const _tokenEndpoint = 
//     'http://localhost:9000/oauth2/token';

//   final _client = oauth2.Client(
//     oauth2.Credentials(_clientId),
//     identifier: _clientId,
//   );

// @override
//   Future<oauth2.Client> login() async {
//     // PKCE автоматически генерируется при создании AuthorizationCodeGrant
//     final grant = oauth2.AuthorizationCodeGrant(
//       _clientId,
//       Uri.parse(_authorizationEndpoint),
//       Uri.parse(_tokenEndpoint),
//     );

//     final authorizationUrl = grant.getAuthorizationUrl(
//       Uri.parse(_redirectUri),
//       scopes: ['openid', 'profile', 'offline_access'],
//     );

//     await launchUrl(authorizationUrl);

//     return !kIsWeb 
//       ? await _listenForCode(grant)
//       : await _handleWebRedirect(grant);
//   }

//   Future<oauth2.Client> _listenForCode(oauth2.AuthorizationCodeGrant grant) async {
//     final server = await HttpServer.bind('localhost', 3000);
//     try {
//       final request = await server.first;
//       final uri = request.requestedUri;
      
//       request.response
//         ..statusCode = 200
//         ..headers.contentType = ContentType.html
//         ..write('<script>window.close();</script>');
//       await request.response.close();

//       return grant.handleAuthorizationResponse(uri.queryParameters);
//     } finally {
//       await server.close();
//     }
//   }

//   Future<oauth2.Client> _handleWebRedirect(oauth2.AuthorizationCodeGrant grant) async {
//     final completer = Completer<Map<String, String>>();
    
//     html.window.onMessage.listen((event) {
//       if (event.origin != html.window.location.origin) return;
      
//       final url = event.data as String;
//       final uri = Uri.parse(url);
//       completer.complete(uri.queryParameters);
//     });

//     final params = await completer.future;
//     return grant.handleAuthorizationResponse(params);
//   }
// @override
//   Future<oauth2.Client> refreshToken(String refreshToken) async {
//     final response = await _dio.post(
//       _tokenEndpoint,
//       data: {
//         'grant_type': 'refresh_token',
//         'refresh_token': refreshToken,
//         'client_id': _clientId,
//       },
//     );

//     return oauth2.Client(
//   oauth2.Credentials.fromJson(
//     jsonEncode({ // Преобразуем Map в JSON-строку
//       'access_token': response.data['access_token'] as String,
//       'refresh_token': response.data['refresh_token'] as String,
//       'token_type': 'Bearer',
//       'expires_in': response.data['expires_in'] as int,
//     }),
//   ),
// );
//   }
// }

