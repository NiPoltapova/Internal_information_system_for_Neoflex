import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed_neoflex/app_routes.dart';
import 'package:news_feed_neoflex/core/service_locator.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/auth_repository_impl.dart';
import 'package:get_it/get_it.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  setupLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(getIt<AuthRepositoryImpl>()),)
          // Добавить другие Bloc'и при необходимости
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
      initialRoute: AppRoutes.newsFeed,
      routes: AppRoutes.routes,
    );
  }
}