import 'package:flutter/material.dart';
import 'package:news_feed_neoflex/personal_chat_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChatPageState();
  }
}

class ChatPageState extends State<ChatPage> {
  int _selectedIndex = 2; // Начальный индекс
  final TextEditingController _searchController =
      TextEditingController(); // Контроллер для поисковой строки

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/page3',
          arguments: {'title': 'New title2'});
    } else {
      setState(() {
        _selectedIndex = index; // Обновляем индекс при нажатии
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/page2/personalChat': (context) {
          final arguments = (ModalRoute.of(context)?.settings.arguments ??
              <String, dynamic>{}) as Map;

          return PersonalChatPage(userId: arguments['userId']);
        },
      },
      home: Scaffold(
        backgroundColor: Colors.white, // Установите белый цвет фона
        appBar: AppBar(
          backgroundColor: Colors.white, // Установите белый цвет фона
          //foregroundColor: Colors.purple,
          title: const Text("Чаты"),
        ),
        body: Column(
          children: [
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Поиск',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Закругление углов
                    borderSide:
                        const BorderSide(color: Colors.grey), // Цвет границы
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Закругление углов при фокусе
                    borderSide: const BorderSide(
                        color: Colors.purple), // Цвет границы при фокусе
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Логика поиска по введенному тексту
                      print('Searching for ${_searchController.text}');
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Замените на количество чатов
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/images/imageMyProfile.jpg"), // Замените на динамическое изображение
                    ),
                    title: Text('Имя Пользователя $index'), // Имя пользователя
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200, // Ширина прямоугольника для переписки
                          height: 50, // Высота прямоугольника
                          color: Colors.transparent, // Цвет фона прямоугольника
                          child: Center(
                              child: Text(
                                  'Имя пользователя $index')), // Текст внутри прямоугольника
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                                12), // Закругление углов для уведомлений
                          ),
                          child: const Text('3',
                              style: TextStyle(
                                  color:
                                      Colors.white)), // Количество уведомлений
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/page2/personalChat',
                          arguments: {
                            'userId': 'Имя пользователя $index'
                          }); // Переход на страницу переписки
                    },
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white, // Установите белый цвет фона
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.computer), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.message_sharp), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
          currentIndex: _selectedIndex, // Индекс выбранного элемента
          onTap: _onItemTapped, // Метод для обработки нажатий
          selectedItemColor:
              const Color(0xFF48036F), // Фиолетовый цвет для выбранного элемента
          unselectedItemColor:
              Colors.grey, // Серый цвет для невыбранных элементов
        ),
      ),
    );
  }
}
