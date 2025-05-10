import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:openapi/openapi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../features/auth/auth_repository_impl.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() async {
  final isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);
  
  final storage = isMobile
    ? MobileSecureStorage()
    : WebSecureStorage(await SharedPreferences.getInstance());

  final authRepo = AuthRepositoryImpl(
    storage: storage,
    isMobile: isMobile,
  );

  final dio = Dio(BaseOptions(
    baseUrl: kIsWeb ? 'https://example.com' : 'http://localhost:8080',
    connectTimeout: const Duration(seconds: 10),
  ));

 dio.interceptors.addAll([
  LogInterceptor(
    requestHeader: true,
    responseHeader: true,
    requestBody: true,
    responseBody: true,
  ),
  QueuedInterceptorsWrapper(
    onRequest: (options, handler) async {
      final token = await authRepo.getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    },
    onError: (DioException error, ErrorInterceptorHandler handler) async {
      if (error.response?.statusCode == 401) {
        try {
          final client = await authRepo.refreshToken();
          final newOptions = error.requestOptions.copyWith(
            headers: {
              ...error.requestOptions.headers,
              'Authorization': 'Bearer ${client.credentials.accessToken}'
            },
          );
          final response = await dio.fetch(newOptions);
          return handler.resolve(response);
        } catch (e) {
          await authRepo.logout();
          // Преобразовываем обычное исключение в DioException
          return handler.reject(DioException(
            requestOptions: error.requestOptions,
            error: e,
          ));
        }
      }
      return handler.next(error);
    },
  ),
]);

  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<AuthRepositoryImpl>(authRepo);
  getIt.registerSingleton<Openapi>(Openapi(dio: dio));
}
