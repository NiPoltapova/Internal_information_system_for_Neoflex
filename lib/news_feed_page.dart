import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_feed_neoflex/features/auth/presentation/screens/login_screen.dart';
import 'package:news_feed_neoflex/horizontal_image_slider.dart';
import 'package:news_feed_neoflex/post_model.dart';
import 'package:news_feed_neoflex/role_manager/edit_post_page.dart';
import 'package:news_feed_neoflex/role_manager/new_post_page/new_post_page.dart';

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

  @override
  void initState() {
    super.initState();
    filteredPosts = [];
    loadPosts();
  }

  Future<void> loadPosts() async {
    setState(() {
      isLoading = true;
    });

    try {
      final String jsonString =
          await rootBundle.loadString('assets/images.json');
      final Map<String, dynamic> json = jsonDecode(jsonString);
      final List<dynamic> postsData = json['posts'];

      List<Post> newPosts = [];
      for (var postData in postsData) {
        List<String> imageUrls = List<String>.from(
            (postData['images'] as List<dynamic>)
                .map((imageName) => 'assets/images/$imageName'));
        String textFileName = postData['text'];
        String text = await loadText(textFileName);
        DateTime date = DateTime.parse(postData['date']);
        int views = postData['views'] ?? 0;

        newPosts.add(
          Post(
            imageUrls: imageUrls,
            textFileName: textFileName,
            text: text,
            comments: [],
            date: date,
            views: views,
          ),
        );
        showCommentInput.add(false);
      }

      setState(() {
        posts = newPosts;
        filteredPosts = List.from(newPosts);
        //_applySort();
        isLoading = false;
      });
    } catch (e) {
      print('Error loading posts: $e');
      setState(() {
        isLoading = false;
      });
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

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/page1');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/page2');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/page3',
          arguments: {'title': 'New title2'});
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
                post.date.year == _selectedDate?.year &&
                post.date.month == _selectedDate?.month &&
                post.date.day == _selectedDate?.day)
            .toList();
      }
      _applySort();
    });
  }

  void _applySort() {
    setState(() {
      if (_sortBy == 'date') {
        filteredPosts.sort((a, b) => _sortAscending
            ? a.date.compareTo(b.date)
            : b.date.compareTo(a.date));
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
            initialText: post.text,
            initialImagePaths: post.imageUrls,
            onSave: (newText, newImages) {
              setState(() {
                filteredPosts[index].text = newText;
                filteredPosts[index].imageUrls = newImages;
              });
            },
            onDelete: () {
              setState(() {
                posts.removeAt(index);
                filteredPosts.removeAt(index);
              });
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
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }), //Переход на страницу авторизации
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
          ),
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
                                        '${post.date.day}.${post.date.month}.${post.date.year}',
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
