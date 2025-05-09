import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_feed_neoflex/horizontal_image_slider.dart';
import 'package:news_feed_neoflex/new_post_page.dart';

class Post {
  final List<String> imageUrls;
  final String textFileName;
  String text;
  final List<String> comments;
  bool isLiked;
  int likesCount;

  Post({
    required this.imageUrls,
    required this.textFileName,
    required this.text,
    required this.comments,
    this.isLiked = false,
    this.likesCount = 0,
  });
}

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  NewsFeedState createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 0;
  List<Post> posts = [];
  List<bool> showCommentInput = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
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

        newPosts.add(
          Post(
            imageUrls: imageUrls,
            textFileName: textFileName,
            text: text,
            comments: const [],
          ),
        );
        showCommentInput.add(false); // Initialize comment input visibility
      }

      setState(() {
        posts = newPosts;
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
        posts[index].comments.add(comment);
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
      posts[index].isLiked = !posts[index].isLiked;
      posts[index].likesCount += posts[index].isLiked ? 1 : -1;
    });
  }

  void _onItemTapped(int index) {
    if (index == 2) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            AppBar(
              foregroundColor: Colors.purple,
              leading: const Icon(Icons.image),
              title: const Align(
                alignment: Alignment.centerLeft,
                child: Text("Главная"),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPostPage()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {
                    // Handle notification functionality
                  },
                ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: 500,
                          margin: const EdgeInsets.symmetric(vertical: 5),
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
                            onPressed: () => toggleCommentInput(index),
                          ),
                        ],
                      ),
                      if (showCommentInput.length > index &&
                          showCommentInput[index]) ...[
                        for (var comment in post.comments)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                                    labelText: 'Напишите комментарий...'),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                String commentText = _controller.text.trim();
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
