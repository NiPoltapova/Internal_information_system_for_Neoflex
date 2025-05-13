import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed_neoflex/role_manager/users_page/create_user_page.dart';
import 'package:news_feed_neoflex/role_manager/users_page/user_profile_page.dart';
import 'dart:io';
import 'package:openapi/openapi.dart';
import 'package:http/http.dart' as http;
import 'package:news_feed_neoflex/features/auth/auth_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart';

class ListOfUsers extends StatefulWidget {
  const ListOfUsers({super.key});

  @override
  _ListOfUsersState createState() => _ListOfUsersState();
}

class _ListOfUsersState extends State<ListOfUsers> {
  static const Map<String, String> _roleDisplayNames = {
    'ROLE_USER': 'Сотрудник',
    'ROLE_ADMIN': 'Администратор',
  };
  final UserControllerApi userApi = GetIt.I<Openapi>().getUserControllerApi();
  List<UserDTO> _users = []; // Получаем пользователей
  List<UserDTO> _filteredUsers = [];
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 3;
  bool _isSearchActive = false;
  bool _isLoading = true;
  String? _errorMessage;
  final dio = GetIt.I<Dio>(); // Получаем экземпляр Dio из GetIt
  late String _avatarBaseUrl;
  late String accessToken;

  @override
  void initState() {
    super.initState();
    final dio = GetIt.I<Dio>();
    _avatarBaseUrl = dio.options.baseUrl;

    // Убедимся, что URL заканчивается на /
    if (!_avatarBaseUrl.endsWith('/')) {
      _avatarBaseUrl += '/';
    }

    // Загружаем токен и настраиваем API
    GetIt.I<AuthRepositoryImpl>().getAccessToken().then((token) {
      if (token != null) {
        setState(() {
          accessToken = token;
        });
        // Добавляем токен в заголовки Dio
        dio.options.headers['Authorization'] = 'Bearer $token';
        _loadUsers();
      } else {
        setState(() {
          _errorMessage = 'Требуется авторизация';
          _isLoading = false;
        });
      }
    }).catchError((e) {
      setState(() {
        _errorMessage = 'Ошибка получения токена: ${e.toString()}';
        _isLoading = false;
      });
    });
  }

  Future<void> _loadUsers() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      debugPrint('Загрузка списка пользователей...');
      debugPrint('Токен доступа: $accessToken');

      final response = await userApi.getAllUsers();
      debugPrint('Ответ сервера: ${response.statusCode}');

      if (response.data != null) {
        debugPrint('Получено пользователей: ${response.data!.length}');
        setState(() {
          _users = response.data!.toList();
          _filteredUsers = List.from(_users);
        });
      } else {
        setState(() {
          _errorMessage = 'Не удалось загрузить список пользователей';
        });
        debugPrint('Пустой ответ от сервера');
      }
    } catch (e, stackTrace) {
      debugPrint('Ошибка загрузки пользователей: $e');
      debugPrint('Стек вызовов: $stackTrace');
      setState(() {
        _errorMessage = 'Ошибка загрузки: ${e.toString()}';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _filterUsers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _isSearchActive = query.isNotEmpty;
      _filteredUsers = _users.where((user) {
        final fio =
            '${user.firstName ?? ''} ${user.lastName ?? ''} ${user.patronymic ?? ''}'
                .toLowerCase();
        return fio.contains(query) ||
            (user.appointment?.toLowerCase().contains(query) ?? false);
      }).toList();
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _isSearchActive = false;
      _filteredUsers = List.from(_users);
    });
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/page1');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/page2');
    } else if (index == 0) {
      Navigator.pushNamed(context, '/');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Future<void> _updateUserData(UserDTO updatedUser) async {
    try {
      if (updatedUser.id == null) {
        throw Exception('ID пользователя отсутствует');
      }

      final response =
          await GetIt.I<Openapi>().getUserControllerApi().adminUpdateUser(
                id: updatedUser.id!,
                userDTO: UserDTO((b) => b
                  ..firstName = updatedUser.firstName
                  ..lastName = updatedUser.lastName
                  ..patronymic = updatedUser.patronymic
                  ..phoneNumber = updatedUser.phoneNumber
                  ..appointment = updatedUser.appointment
                  ..roleName = updatedUser.roleName
                  ..login = updatedUser.login
                  ..birthday = updatedUser.birthday),
              );

      if (response.data == null) {
        throw Exception('Не удалось обновить пользователя');
      }

      await _loadUsers();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка обновления: ${e.toString()}')),
      );
      rethrow;
    }
  }

  Future<void> _deleteUser(int userId) async {
    try {
      await userApi.adminDeleteUser(id: userId);
      await _loadUsers();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Ошибка удаления пользователя: ${e.toString()}')),
      );
    }
  }

  Future<void> _addNewUser(Map<String, String?> userData) async {
    try {
      Date birthday;
      try {
        // Парсим дату из строки формата YYYY-MM-DD
        final dateStr = userData['birthDate'];
        if (dateStr == null) throw Exception('Дата рождения обязательна');

        final date = DateTime.parse(dateStr);
        birthday = Date(date.year, date.month, date.day);
      } catch (e) {
        throw Exception('Неверный формат даты рождения: ${e.toString()}');
      }
      final createRequest = UserExtendedDTO((b) => b
        ..firstName = userData['firstName'] ?? ''
        ..lastName = userData['lastName'] ?? ''
        ..patronymic = userData['patronymic']
        ..phoneNumber = userData['phone']
        ..appointment = userData['position']
        ..roleName =
            userData['role'] == 'Администратор' ? 'ROLE_ADMIN' : 'ROLE_USER'
        ..login = userData['login']
        ..password = userData['password']
        ..birthday = birthday);

      debugPrint('Отправка данных пользователя: ${createRequest.toString()}');

      final response = await userApi.adminCreateUser(
        userExtendedDTO: createRequest,
      );
      if (response.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пользователь успешно создан')),
        );
        await _loadUsers();
      } else {
        throw Exception('Не удалось создать пользователя: ответ сервера пуст');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Ошибка создания пользователя: ${e.toString()}')),
      );
    }
  }

  // Date? _parseDate(String dateString) {
  //   try {
  //     final dateTime = DateTime.parse(dateString);
  //     return Date(dateTime.year, dateTime.month, dateTime.day);
  //   } catch (e) {
  //     return null;
  //   }
  // }

  Future<void> _updateAvatar(UserDTO user, File? avatarFile) async {
    if (avatarFile == null) return;

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Определяем MIME-тип и расширение файла
      final mimeType = lookupMimeType(avatarFile.path) ?? 'image/jpeg';
      final contentType = MediaType.parse(mimeType);
      final fileExtension = contentType.subtype;

      // Создаем MultipartFile
      final multipartFile = await MultipartFile.fromFile(
        avatarFile.path,
        filename:
            'avatar_${DateTime.now().microsecondsSinceEpoch}.$fileExtension',
        contentType: contentType,
      );

      // Вызываем API через сгенерированный клиент
      final response =
          await GetIt.I<Openapi>().getUserControllerApi().uploadAvatar(
                file: multipartFile,
                headers: {
                  'Authorization':
                      'Bearer ${GetIt.I<AuthRepositoryImpl>().getAccessToken()}'
                },
                onSendProgress: (sent, total) {
                  debugPrint(
                      'Отправлено: ${(sent / total * 100).toStringAsFixed(1)}%');
                },
              );

      Navigator.of(context).pop();

      if (response.statusCode == 200 && response.data != null) {
        final newAvatarUrl = response.data!.avatarUrl ?? '';
        final updatedUser = user.rebuild((b) => b..avatarUrl = newAvatarUrl);
        await _updateUserData(updatedUser);
        await _loadUsers();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Аватар успешно обновлён')),
        );
      } else {
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка обновления аватара: ${e.toString()}')),
      );
      debugPrint('Ошибка загрузки аватара: ${e.toString()}');
    }
  }

  Widget _buildAvatarWidget(UserDTO user) {
    final avatarUrl = user.avatarUrl != null
        ? user.avatarUrl!.startsWith('http')
            ? user.avatarUrl
            : '$_avatarBaseUrl${user.avatarUrl!.startsWith('/') ? user.avatarUrl!.substring(1) : user.avatarUrl}'
        : null;

    debugPrint('Avatar URL: $avatarUrl');

    return avatarUrl != null
        ? ClipOval(
            child: CachedNetworkImage(
              imageUrl: avatarUrl!,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              httpHeaders: {
                'Authorization': 'Bearer $accessToken',
              },
              placeholder: (context, url) => Container(
                width: 40,
                height: 40,
                color: Colors.grey,
                child: const Icon(Icons.person, size: 20, color: Colors.white),
              ),
              errorWidget: (context, url, error) {
                debugPrint('Ошибка загрузки аватара: $error');
                return Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey,
                  child: const Icon(Icons.error, size: 20),
                );
              },
            ),
          )
        : Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, size: 20, color: Colors.white),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            AppBar(
              foregroundColor: Colors.purple,
              automaticallyImplyLeading: false,
              title: const Align(
                alignment: Alignment.centerLeft,
                child: Text("Список пользователей"),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateUserPage(
                          onSave: _addNewUser,
                        ),
                      ),
                    );
                  },
                ),
              ],
              surfaceTintColor: const Color.fromARGB(255, 100, 29, 113),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Поиск пользователей',
                labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 104, 102, 102),
                ),
                hintText: 'Введите имя...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(_isSearchActive ? Icons.close : Icons.search),
                  onPressed: () {
                    if (_isSearchActive) {
                      _clearSearch();
                    } else {
                      _filterUsers();
                    }
                  },
                ),
              ),
              onSubmitted: (_) => _filterUsers(),
            ),
          ),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_errorMessage != null)
            Center(child: Text(_errorMessage!))
          else
            Expanded(
              child: ListView.builder(
                itemCount: _filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = _filteredUsers[index];
                  final userFio =
                      '${user.firstName ?? ''} ${user.lastName ?? ''} ${user.patronymic ?? ''}';
                  final avatarUrl = user.avatarUrl != null
                      ? '$_avatarBaseUrl/${user.avatarUrl}'
                      : null;
                  return ListTile(
                    title: Text(userFio),
                    // subtitle: Text(
                    //     '${user.appointment ?? ''} - ${_roleDisplayNames[user.role] ?? user.role ?? ''}'),
                    leading: _buildAvatarWidget(user),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfilePage(
                            userData: {
                              'id': user.id?.toString() ?? '',
                              'fio':
                                  '${user.firstName ?? ''} ${user.lastName ?? ''} ${user.patronymic ?? ''}',
                              'phone': user.phoneNumber ?? '',
                              'position': user.appointment ?? '',
                              'role': user.roleName ?? 'ROLE_USER',
                              'login': user.login ?? '',
                              'birthDate': user.birthday?.toString() ?? '',
                              'avatarUrl': avatarUrl ?? '',
                            },
                            initialAvatarUrl: user.avatarUrl != null
                                ? '$_avatarBaseUrl/${user.avatarUrl}'
                                : null,
                            onSave: _updateUserData,
                            onDelete: _deleteUser,
                            onAvatarChanged: (file) =>
                                _updateAvatar(user, file),
                            isAdmin: true,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.computer), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message_sharp), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF48036F),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
