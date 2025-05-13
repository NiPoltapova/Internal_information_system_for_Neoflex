import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_feed_neoflex/news_feed_page.dart';
import 'package:news_feed_neoflex/role_emloyee/book_page.dart';
import 'package:news_feed_neoflex/role_emloyee/chat_page/chat_page.dart';
import 'package:news_feed_neoflex/role_manager/users_page/user_profile_page.dart';
import 'package:openapi/openapi.dart';
import 'features/auth/presentation/screens/login_screen.dart';

import 'package:news_feed_neoflex/role_manager/users_page/list_of_users.dart';

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

final dio = Dio();

// Создаем стандартные сериализаторы
final serializers = (Serializers().toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UserDTO)]),
        () => ListBuilder<UserDTO>(),
      ))
    .build();

class AppRoutes {
  static const String newsFeed = '/';
  static const String bookPage = '/page1';
  static const String chatPage = '/page2';
  static const String profilePage = '/page3';
  static const String listOfUsers = '/users';
  static const String loginPage = '/login';

  static Map<String, WidgetBuilder> get routes {
    return {
      newsFeed: (context) => const NewsFeed(),
      bookPage: (context) => const BookPage(),
      chatPage: (context) => const ChatPage(),
      profilePage: (context) {
        final userApi = UserControllerApi(dio, serializers);
        return FutureBuilder<Response<UserDTO>>(
          future: userApi.getCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Ошибка загрузки профиля'));
            } else if (snapshot.hasData) {
              final response = snapshot.data!;
              final user = response.data!; // Извлекаем UserDTO из Response
              return UserProfilePage(
                userData: {
                  'id': user.id?.toString() ?? '',
                  'fio': '${user.firstName ?? ''} ${user.lastName ?? ''}',
                  'phone': user.phoneNumber ?? '',
                  'position': user.appointment ?? '',
                  'role': user.roleName ?? 'ROLE_USER',
                  'login': user.login ?? '',
                  'birthDate': user.birthday?.toString() ?? '',
                  'avatarUrl': user.avatarUrl ?? '',
                },
                onSave: (updatedUser) {
                  // // Логика сохранения данных пользователя
                  // context.read<AuthBloc>().add(UpdateUserProfile(updatedUser));
                },
                onDelete: (userId) {
                  // Логика удаления пользователя
                },
                onAvatarChanged: (file) {
                  // Логика обновления аватара
                },
              );
            }
            return const LoginScreen();
          },
        );
      },
      listOfUsers: (context) => ListOfUsers(),
      loginPage: (context) => const LoginScreen(), // Добавляем страницу входа
    };
  }
}
