//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:openapi/src/serializers.dart';
import 'package:openapi/src/auth/api_key_auth.dart';
import 'package:openapi/src/auth/basic_auth.dart';
import 'package:openapi/src/auth/bearer_auth.dart';
import 'package:openapi/src/auth/oauth.dart';
import 'package:openapi/src/api/booking_controller_api.dart';
import 'package:openapi/src/api/chat_controller_api.dart';
import 'package:openapi/src/api/comment_controller_api.dart';
import 'package:openapi/src/api/file_controller_api.dart';
import 'package:openapi/src/api/like_controller_api.dart';
import 'package:openapi/src/api/media_controller_api.dart';
import 'package:openapi/src/api/message_controller_api.dart';
import 'package:openapi/src/api/post_controller_api.dart';
import 'package:openapi/src/api/repost_controller_api.dart';
import 'package:openapi/src/api/user_controller_api.dart';
import 'package:openapi/src/api/workspace_controller_api.dart';

class Openapi {
  static const String basePath = r'http://localhost:8080';

  final Dio dio;
  final Serializers serializers;

  Openapi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get BookingControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BookingControllerApi getBookingControllerApi() {
    return BookingControllerApi(dio, serializers);
  }

  /// Get ChatControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ChatControllerApi getChatControllerApi() {
    return ChatControllerApi(dio, serializers);
  }

  /// Get CommentControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CommentControllerApi getCommentControllerApi() {
    return CommentControllerApi(dio, serializers);
  }

  /// Get FileControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FileControllerApi getFileControllerApi() {
    return FileControllerApi(dio, serializers);
  }

  /// Get LikeControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  LikeControllerApi getLikeControllerApi() {
    return LikeControllerApi(dio, serializers);
  }

  /// Get MediaControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MediaControllerApi getMediaControllerApi() {
    return MediaControllerApi(dio, serializers);
  }

  /// Get MessageControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MessageControllerApi getMessageControllerApi() {
    return MessageControllerApi(dio, serializers);
  }

  /// Get PostControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PostControllerApi getPostControllerApi() {
    return PostControllerApi(dio, serializers);
  }

  /// Get RepostControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  RepostControllerApi getRepostControllerApi() {
    return RepostControllerApi(dio, serializers);
  }

  /// Get UserControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserControllerApi getUserControllerApi() {
    return UserControllerApi(dio, serializers);
  }

  /// Get WorkspaceControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  WorkspaceControllerApi getWorkspaceControllerApi() {
    return WorkspaceControllerApi(dio, serializers);
  }
}
