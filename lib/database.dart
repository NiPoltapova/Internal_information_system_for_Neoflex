// import 'dart:convert';
// //import 'dart:io';
// import 'package:flutter/services.dart';
// // ignore: depend_on_referenced_packages
// import 'package:path/path.dart';
// //import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;

//   DatabaseHelper._internal();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB();
//     return _database!;
//   }

//   Future<Database> _initDB() async {
//     //-
//     // String databasesPath = await getDatabasesPath();

//     // // Создаем директорию, если она не существует
//     // if (!await Directory(databasesPath).exists()) {
//     //   await Directory(databasesPath).create(recursive: true);
//     // }

//     // String path = join(databasesPath, 'profile.db');

//     String path = join(await getDatabasesPath(), 'profile.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         // Экранируем зарезервированное слово "group"
//         await db.execute('''
//           CREATE TABLE profile(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             fio TEXT,
//             telephone TEXT,
//             position TEXT,
//             'group' TEXT
//           )
//         ''');
//       },
//     );
//   }

//   Future<void> insertProfile(
//       String fio, String telephone, String position, String groupName) async {
//     final db = await database;
//     await db.insert('profile', {
//       'fio': fio,
//       'telephone': telephone,
//       'position': position,
//       'group': groupName
//     });
//   }

//   Future<Map<String, dynamic>?> getProfile() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('profile');
//     return maps.isNotEmpty ? maps.first : null;
//   }

//   Future<void> loadInitialData() async {
//     try {
//       final String response = await rootBundle.loadString('assets/data.json');
//       final data = json.decode(response);
//       await insertProfile(
//           data['fio'], data['telephone'], data['position'], data['group']);
//     } catch (e) {
//       print("Ошибка загрузки данных: $e");
//     }
//   }
// }
