// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'auth_service.dart';

// class ApiService {
//   final Dio _dio;
//   final FlutterSecureStorage _secureStorage;
//   final AuthService _authService;

//   ApiService({
//     required Dio dio,
//     required FlutterSecureStorage secureStorage,
//     required AuthService authService,
//   })  : _dio = dio,
//         _secureStorage = secureStorage,
//         _authService = authService {
//     _initDio();
//     _loadToken();
//   }

//   void _initDio() {
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           final token = await _secureStorage.read(key: 'access_token');
//           if (token != null) {
//             options.headers['Authorization'] = 'Bearer $token';
//           }
//           return handler.next(options);
//         },
//         onError: (error, handler) async {
//           if (error.response?.statusCode == 401) {
//             try {
//               await _authService.login();
//               final newToken = await _secureStorage.read(key: 'access_token');
//               error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
//               return handler.resolve(await _dio.fetch(error.requestOptions));
//             } catch (e) {
//               await _authService.logout();
//               return handler.reject(error);
//             }
//           }
//           return handler.next(error);
//         },
//       ),
//     );
//   }

//   Future<void> _loadToken() async {
//     final token = await _authService.accessToken;
//     if (token != null) {
//       _dio.options.headers['Authorization'] = 'Bearer $token';
//     }
//   }

//   Future<Response> signUp(String email, String password, String username) async {
//     return _dio.post('/auth/signup', data: {
//       'email': email,
//       'password': password,
//       'username': username,
//     });
//   }

//   Future<Response> getPosts() async {
//     return _dio.get('/posts');
//   }
// }