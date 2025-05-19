import 'dart:convert';
import 'dart:io';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed_neoflex/app_routes.dart';
import 'package:news_feed_neoflex/features/auth/auth_repository_impl.dart';
import 'package:news_feed_neoflex/features/auth/presentation/screens/login_screen.dart';
import 'package:news_feed_neoflex/horizontal_image_slider.dart';
import 'package:news_feed_neoflex/post_model.dart';
import 'package:news_feed_neoflex/role_manager/edit_post_page.dart';
import 'package:news_feed_neoflex/role_manager/new_post_page/new_post_page.dart';
import 'package:news_feed_neoflex/role_manager/users_page/user_profile_page.dart';
import 'package:openapi/openapi.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  NewsFeedState createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 0;
  List<Post> posts = [];
  List<Post> filteredPosts = [];
  List<bool> showCommentInput = [];
  bool isLoading = false;
  String _sortBy = 'date';
  bool _sortAscending = true;
  bool _showFilters = false;
  DateTime? _selectedDate;
  String? _currentUserRole;
  bool _isRoleLoaded = false;
  bool _isAdmin = false;
  String? _errorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    filteredPosts = [];
    _initializeApp();
    // _loadUserRole();
    // loadPosts();
  }

  Future<void> _initializeApp() async {
    final token = await GetIt.I<AuthRepositoryImpl>().getAccessToken();
    if (token == null) {
      _handleInvalidToken();
      return;
    }

    // Настраиваем Dio
    final dio = GetIt.I<Dio>();
    dio.options.headers['Authorization'] = 'Bearer $token';

    // Затем загружаем данные
    await Future.wait([
      _loadUserRole(),
      loadPosts(),
    ]);
  }

  Future<void> _loadUserRole() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
      final token = await GetIt.I<AuthRepositoryImpl>().getAccessToken();
      if (token == null) {
        throw Exception('No access token');
      }

      final dio = GetIt.I<Dio>();
      dio.options.headers['Authorization'] = 'Bearer $token';

      final userApi = GetIt.I<Openapi>().getUserControllerApi();
      final response = await userApi.getCurrentUser();

      if (response.data!.roleName == null || response.data == null) {
        throw Exception('Failed to load user role');
      }

      setState(() {
        _currentUserRole = response.data!.roleName?.toUpperCase().trim();
        _isAdmin = _currentUserRole == 'ROLE_ADMIN';
        _isRoleLoaded = true;
      });
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        _handleInvalidToken();
      } else {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Ошибка загрузки роли: ${e.message}')),
        // );
        debugPrint('Error loading user role: ${e.message}');
      }
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Ошибка: $e')),
      // );
      debugPrint('Unexpected error: $e');
    }
    // finally {
    //   if (mounted) {
    //     setState(() {
    //       _isRoleLoaded = true;
    //     });
    //   }
    // }
  }

  // Future<void> _loadUserRole() async {
  //   try {
  //     setState(() {
  //       _isRoleLoaded = false;
  //     });

  //     final userApi = GetIt.I<Openapi>().getUserControllerApi();
  //     final response = await userApi.getCurrentUser();

  //     if (response.data == null || response.data!.roleName == null) {
  //       throw Exception('User data or role is null');
  //     }

  //     if (mounted) {
  //       setState(() {
  //         _currentUserRole = response.data!.roleName!.toUpperCase().trim();
  //         _isAdmin = _currentUserRole == 'ROLE_ADMIN';
  //         _isRoleLoaded = true;
  //         print('User role loaded: $_currentUserRole, isAdmin: $_isAdmin');
  //       });
  //     }
  //   } on DioException catch (e) {
  //     print('DioError loading user role: ${e.message}');
  //     if (e.response?.statusCode == 401) {
  //       // Токен невалиден - нужно разлогинить
  //       _handleInvalidToken();
  //     }
  //   } catch (e) {
  //     print('Error loading user role: $e');
  //   } finally {
  //     if (mounted && !_isRoleLoaded) {
  //       setState(() {
  //         _isRoleLoaded = true; // Чтобы не заблокировать UI
  //       });
  //     }
  //   }
  // }

  void _handleInvalidToken() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.loginPage,
      (route) => false,
    );
  }

  Future<void> loadPosts() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // 1. Получаем токен
      final token = await GetIt.I<AuthRepositoryImpl>().getAccessToken();

      // 2. Настраиваем Dio
      final dio = GetIt.I<Dio>();
      dio.options.headers['Authorization'] = 'Bearer $token';

      // 3. Делаем запрос
      final postApi = GetIt.I<Openapi>().getPostControllerApi();
      final response = await postApi.getAllPosts(
        sortBy: _sortBy,
        page: 0,
        size: 100,
      );

      // 4. Проверяем ответ
      if (response.statusCode != 200 || response.data == null) {
        throw Exception('Server returned ${response.statusCode}');
      }

      // 5. Обрабатываем данные
      final pageResponse = response.data!;
      final postDTOs = pageResponse.content ?? BuiltList<PostResponseDTO>();

      final newPosts =
          postDTOs.map((dto) => Post.fromResponseDto(dto)).toList();

      setState(() {
        posts = newPosts;
        filteredPosts = List.from(newPosts);
        showCommentInput = List.filled(newPosts.length, false);
      });
    } on DioException catch (e) {
      debugPrint('DioError: ${e.message}');
      debugPrint('Response: ${e.response}');

      setState(() {
        _errorMessage = 'Ошибка загрузки: ${e.message}';
      });

      if (e.response?.statusCode == 401) {
        _handleInvalidToken();
      }
    } catch (e, stack) {
      debugPrint('Error: $e');
      debugPrint('Stack: $stack');
      setState(() {
        _errorMessage = 'Неизвестная ошибка';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // Future<void> loadPosts() async {
  //   if (!mounted) return;

  //   setState(() {
  //     isLoading = true;
  //   });

  //   print('Starting to load posts...');

  //   try {
  //     final postApi = GetIt.I<Openapi>().getPostControllerApi();
  //     final response = await postApi.getAllPosts().catchError((error) async {
  //       if (error is DioException && error.response?.statusCode == 401) {
  //         // Попытка обновить токен
  //         await _refreshToken();
  //         // Повторный запрос после обновления токена
  //         return await postApi.getAllPosts();
  //       }
  //       throw error;
  //     });

  //     print('Response status: ${response.statusCode}');
  //     print('Response data length: ${response.data?.length ?? 0}');

  //     if (response.data == null) {
  //       print('No posts data received');
  //       throw Exception('No posts data received');
  //     }

  //     List<Post> newPosts = [];
  //     for (var postDto in response.data!) {
  //       print('Processing post with ID: ${postDto.id}'); // Добавлено
  //       print('Post text: ${postDto.text}'); // Добавлено
  //       print('Media URLs count: ${postDto.mediaUrls?.length ?? 0}');
  //       newPosts.add(Post.fromDto(postDto));
  //       showCommentInput.add(false);
  //     }

  //     print('Successfully loaded ${newPosts.length} posts');

  //     setState(() {
  //       posts = newPosts;
  //       filteredPosts = List.from(newPosts);
  //       _applySort();
  //       isLoading = false;
  //     });
  //   } on DioException catch (e) {
  //     print('DioError loading posts: ${e.message}');
  //     print('Response data: ${e.response?.data}');
  //     if (e.response?.statusCode == 401) {
  //       _handleInvalidToken();
  //     }
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print('Error loading posts: $e');
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  Future<void> _refreshToken() async {
    try {
      // Здесь должна быть логика обновления токена
      // Например, через Auth0 или ваш сервер аутентификации
      // После успешного обновления сохраните новый токен
    } catch (e) {
      print('Error refreshing token: $e');
      _handleInvalidToken();
    }
  }

  Future<String> loadText(String fileName) async {
    try {
      return await rootBundle.loadString('assets/text/$fileName');
    } catch (e) {
      print('Error loading text: $fileName - $e');
      return 'Текст не найден';
    }
  }

  void addComment(int index, String comment) {
    if (comment.isNotEmpty) {
      setState(() {
        filteredPosts[index].comments.add(comment);
        _controller.clear();
      });
    }
  }

  void toggleCommentInput(int index) {
    setState(() {
      // Check if the index is within the bounds of the list
      if (index < showCommentInput.length) {
        showCommentInput[index] = !showCommentInput[index];
      } else {
        // If index is out of bounds, extend list and set to true
        showCommentInput.length = index + 1;
        showCommentInput[index] = true;
      }
    });
  }

  void toggleLike(int index) {
    setState(() {
      filteredPosts[index].isLiked = !filteredPosts[index].isLiked;
      filteredPosts[index].likesCount += filteredPosts[index].isLiked ? 1 : -1;
    });
  }

  void _onItemTapped(int index) async {
    if (index == 1) {
      Navigator.pushNamed(context, AppRoutes.bookPage);
    } else if (index == 2) {
      Navigator.pushNamed(context, AppRoutes.chatPage);
    } else if (index == 3) {
      if (_isAdmin) {
        Navigator.pushNamed(context, AppRoutes.listOfUsers);
      } else {
        try {
          final userApi = GetIt.I<Openapi>().getUserControllerApi();
          final response = await userApi.getCurrentUser();
          if (response.data != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfilePage(
                  userData: {
                    'id': response.data!.id?.toString() ?? '',
                    'fio':
                        '${response.data!.firstName ?? ''} ${response.data!.lastName ?? ''} ${response.data!.patronymic ?? ''}',
                    'phone': response.data!.phoneNumber ?? '',
                    'position': response.data!.appointment ?? '',
                    'role': response.data!.roleName ?? 'ROLE_USER',
                    'login': response.data!.login ?? '',
                    'birthDate': response.data!.birthday?.toString() ?? '',
                    'avatarUrl': response.data!.avatarUrl ?? '',
                  },
                  onSave: (updatedUser) async {
                    try {
                      await GetIt.I<Openapi>()
                          .getUserControllerApi()
                          .updateCurrentUser(userDTO: updatedUser);

                      final updatedResponse = await userApi.getCurrentUser();
                      if (updatedResponse.data != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Профиль успешно обновлен')),
                        );
                      }
                    } catch (e) {
                      debugPrint('API Error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Ошибка сохранения: ${e.toString()}')),
                      );
                      rethrow;
                    }
                  },
                  onDelete: (userId) {
                    // Логика удаления
                  },
                  onAvatarChanged: (file) {
                    // Логика обновления аватара
                  },
                  isAdmin: false,
                ),
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка загрузки профиля: ${e.toString()}')),
          );
        }
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _applyDateFilter() {
    setState(() {
      if (_selectedDate == null) {
        filteredPosts = List.from(posts);
      } else {
        filteredPosts = posts
            .where((post) =>
                post.createdWhen.year == _selectedDate?.year &&
                post.createdWhen.month == _selectedDate?.month &&
                post.createdWhen.day == _selectedDate?.day)
            .toList();
      }
      _applySort();
    });
  }

  void _applySort() {
    setState(() {
      if (_sortBy == 'date') {
        filteredPosts.sort((a, b) => _sortAscending
            ? a.createdWhen.compareTo(b.createdWhen)
            : b.createdWhen.compareTo(a.createdWhen));
      } else if (_sortBy == 'popularity') {
        filteredPosts.sort((a, b) => _sortAscending
            ? (a.likesCount + a.views).compareTo(b.likesCount + b.views)
            : (b.likesCount + b.views).compareTo(a.likesCount + a.views));
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _applyDateFilter();
      });
    }
  }

  void _navigateToEditPost(BuildContext context, Post post, int index) async {
    try {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditPostPage(
            postId: post.id,
            initialText: post.text,
            initialImagePaths: post.imageUrls,
            onSave: (newText, newImages) async {
              try {
                final postApi = GetIt.I<Openapi>().getPostControllerApi();
                final files = newImages
                    .map((path) => MultipartFile.fromFileSync(path))
                    .toList();

                if (post.id == null) {
                  // Создание нового поста
                  await postApi.createPost(
                    text: newText,
                    files: BuiltList(files),
                  );
                } else {
                  // Обновление существующего поста
                  await postApi.updatePost(
                    id: post.id!,
                    postDTO: PostDTO((b) => b..text = newText),
                    files: BuiltList(files),
                  );
                }

                // Обновляем список постов после изменения
                await loadPosts();
              } catch (e) {
                print('Error saving post: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ошибка сохранения: ${e.toString()}')),
                );
              }
            },
            onDelete: () async {
              try {
                if (post.id != null) {
                  final postApi = GetIt.I<Openapi>().getPostControllerApi();
                  await postApi.deletePost(id: post.id!);
                  setState(() {
                    posts.removeAt(index);
                    filteredPosts.removeAt(index);
                  });
                }
              } catch (e) {
                print('Error deleting post: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ошибка удаления: ${e.toString()}')),
                );
              }
            },
          ),
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('Ошибка при редактировании поста: $e');
      debugPrint('Стек вызовов: $stackTrace');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Ошибка при открытии редактора: ${e.toString()}')),
      );
    }
  }

  Widget _buildFilterControls() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 375;
          return Column(
            children: [
              isSmallScreen
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Фильтр по дате:',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[200],
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                ),
                                onPressed: () => _selectDate(context),
                                child: Text(
                                  _selectedDate == null
                                      ? 'Выберите дату'
                                      : '${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            if (_selectedDate != null)
                              IconButton(
                                icon: const Icon(Icons.clear, size: 20),
                                onPressed: () {
                                  setState(() {
                                    _selectedDate = null;
                                    _applyDateFilter();
                                  });
                                },
                              ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const Text('Фильтр по дате:',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        const SizedBox(width: 10),
                        IntrinsicWidth(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              foregroundColor: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                            onPressed: () => _selectDate(context),
                            child: Text(
                              _selectedDate == null
                                  ? 'Выберите дату'
                                  : '${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        if (_selectedDate != null)
                          IconButton(
                            icon: const Icon(Icons.clear, size: 20),
                            onPressed: () {
                              setState(() {
                                _selectedDate = null;
                                _applyDateFilter();
                              });
                            },
                          ),
                      ],
                    ),
              const SizedBox(height: 12),
              isSmallScreen
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Сортировка:',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: _sortBy,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'date',
                                    child: Text('По дате'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'popularity',
                                    child: Text('По популярности'),
                                  ),
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    _sortBy = value!;
                                    _applySort();
                                  });
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _sortAscending
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                color: Colors.purple,
                              ),
                              onPressed: () {
                                setState(() {
                                  _sortAscending = !_sortAscending;
                                  _applySort();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const Text('Сортировка:',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        const SizedBox(width: 40),
                        IntrinsicWidth(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: _sortBy,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                            items: const [
                              DropdownMenuItem(
                                value: 'date',
                                child: Text('По дате'),
                              ),
                              DropdownMenuItem(
                                value: 'popularity',
                                child: Text('По популярности'),
                              ),
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                _sortBy = value!;
                                _applySort();
                              });
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _sortAscending
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: Colors.purple,
                          ),
                          onPressed: () {
                            setState(() {
                              _sortAscending = !_sortAscending;
                              _applySort();
                            });
                          },
                        ),
                      ],
                    ),

              const SizedBox(height: 12),

              // Кнопка сброса
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.refresh, size: 24),
                  onPressed: () {
                    setState(() {
                      _selectedDate = null;
                      _sortBy = 'date';
                      _sortAscending = true;
                      filteredPosts = List.from(posts);
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isRoleLoaded) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.purple,
        leading: const Icon(Icons.image),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Главная"),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
          ),
          if (_isAdmin)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPostPage()),
                );
              },
            ),
          // IconButton(
          //   icon: const Icon(Icons.notifications_none),
          //   onPressed: () {},
          // ),
        ],
        surfaceTintColor: const Color.fromARGB(255, 100, 29, 113),
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          if (_showFilters) _buildFilterControls(),
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : filteredPosts.isEmpty
                      ? const Center(
                          child: Text(
                              'Нет постов, соответствующих вашему запросу'))
                      : ListView.builder(
                          itemCount: filteredPosts.length,
                          itemBuilder: (context, index) {
                            final post = filteredPosts[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${post.createdWhen.day}.${post.createdWhen.month}.${post.createdWhen.year}',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.remove_red_eye,
                                              size: 16, color: Colors.grey),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${post.views}',
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: 500,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: HorizontalImageSlider(
                                      imageUrls: post.imageUrls,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        post.isLiked
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: post.isLiked ? Colors.red : null,
                                      ),
                                      onPressed: () => toggleLike(index),
                                    ),
                                    Text('${post.likesCount}'),
                                    const SizedBox(width: 10),
                                    IconButton(
                                      icon: const Icon(Icons.message),
                                      onPressed: () =>
                                          toggleCommentInput(index),
                                    ),
                                    if (_isAdmin)
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () => _navigateToEditPost(
                                            context, post, index),
                                      ),
                                  ],
                                ),
                                if (showCommentInput.length > index &&
                                    showCommentInput[index]) ...[
                                  for (var comment in post.comments)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text('- $comment'),
                                    ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _controller,
                                          onSubmitted: (value) =>
                                              addComment(index, value),
                                          decoration: const InputDecoration(
                                              labelText:
                                                  'Напишите комментарий...'),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.send),
                                        onPressed: () {
                                          String commentText =
                                              _controller.text.trim();
                                          addComment(index, commentText);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    post.text,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const SizedBox(height: 50),
                              ],
                            );
                          },
                        ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF48036F),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
