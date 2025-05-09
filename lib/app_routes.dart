import 'package:flutter/material.dart';
import 'package:news_feed_neoflex/news_feed_page.dart';
import 'package:news_feed_neoflex/role_emloyee/book_page.dart';
import 'package:news_feed_neoflex/role_emloyee/chat_page/chat_page.dart';
import 'package:news_feed_neoflex/role_emloyee/profile_page.dart';
import 'features/auth/presentation/screens/login_screen.dart';

import 'package:news_feed_neoflex/role_manager/users_page/list_of_users.dart';

class AppRoutes {
  static const String newsFeed = '/';
  static const String bookPage = '/page1';
  static const String chatPage = '/page2';
  static const String profilePage = '/page3';
  static const String loginPage = '/login';

  static Map<String, WidgetBuilder> get routes {
    return {
      newsFeed: (context) => const NewsFeed(),
      bookPage: (context) => const BookPage(),
      chatPage: (context) => const ChatPage(),
      //profilePage: (context) => const Profile(),
      loginPage: (context) => const LoginScreen(),      // Добавляем страницу входа
      //profilePage: (context) => Profile(),
      profilePage: (context) => ListOfUsers(),
    };
  }
}
