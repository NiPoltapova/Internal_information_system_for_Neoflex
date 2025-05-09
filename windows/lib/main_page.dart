import 'package:flutter/material.dart';
import 'package:news_feed_neoflex/chat_page.dart';
import 'package:news_feed_neoflex/news_feed_page.dart';
import 'package:news_feed_neoflex/profile_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) {
          return const NewsFeed();
        },
        '/page2': (context) {
          return const ChatPage();
        },
        // '/page2/personalChat': (context) {
        //   return PersonalChatPage();
        // },
        '/page3': (context) {
          return const Profile();
        },
      },
    );
  }
}
