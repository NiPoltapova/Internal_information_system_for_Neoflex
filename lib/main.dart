import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed_neoflex/app_routes.dart';
import 'package:news_feed_neoflex/core/service_locator.dart';
import 'package:news_feed_neoflex/features/auth/presentation/screens/login_screen.dart';
import 'package:news_feed_neoflex/news_feed_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/auth_repository_impl.dart';

void main() {
  // Инициализация Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация sqflite для Windows
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  // Настройка локатора сервисов
  setupLocator();

  runApp(
    MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<AuthBloc>(
            create: (BuildContext context) =>
                AuthBloc(getIt<AuthRepositoryImpl>()))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Image List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.loginPage,
      routes: AppRoutes.routes,
    );
  }
}
