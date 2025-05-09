import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'database.dart'; // Импортируйте ваш класс DatabaseHelper

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _fiocontroller;
  late TextEditingController _telephoneController;
  late TextEditingController _positionController; // Контроллер для должности
  late TextEditingController _teamController; // Контроллер для команды

  int _selectedIndex = 3; // Начальный индекс

  void _onItemTapped(int index) {
    if (index == 2) {
      //Индекс для иконки чаты
      Navigator.pushNamed(context, '/page2');
    } else if (index == 0) {
      // Индекс для иконки профиля
      Navigator.pushNamed(context, '/');
    } else {
      setState(() {
        _selectedIndex = index; // Обновляем индекс при нажатии
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fiocontroller = TextEditingController(text: 'Бублик Петрович');
    _telephoneController = TextEditingController(text: '123456789');
    _positionController = TextEditingController(
        text: 'Продукт менеджер'); // Изначально пустое поле
    _teamController =
        TextEditingController(text: 'Team A'); // Изначально пустое поле
    loadData(); // Загружаем данные при инициализации
  }

  //!!! данные не загружаются из БД
  Future<void> loadData() async {
    DatabaseHelper dbHelper = DatabaseHelper();

    // Загрузка начальных данных из файла и вставка в БД
    await dbHelper.loadInitialData();

    // Получение профиля из БД
    Map<String, dynamic>? profile = await dbHelper.getProfile();

    if (profile != null) {
      setState(() {
        _fiocontroller.text = profile['fio'] ?? ''; // Устанавливаем ФИО из БД
        _telephoneController.text = profile['telephone'] ?? '';
        _positionController.text =
            profile['position'] ?? ''; // Устанавливаем должность из БД
        _teamController.text =
            profile['team'] ?? ''; // Устанавливаем команду из БД
      });
    } else {
      print("Профиль не найден"); // Отладочная информация
    }
  }

  void saveProfile() {
    // Логика для сохранения профиля в базе данных
    DatabaseHelper dbHelper = DatabaseHelper();
    dbHelper.insertProfile(
      _fiocontroller.text,
      _telephoneController.text,
      _positionController.text,
      _teamController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Профиль сохранен!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.purple,
          title: const Text("PROFILE"),
          actions: [
            IconButton(
              icon: const Icon(Icons.save), // Иконка для кнопки сохранить
              onPressed: saveProfile, // Вызов метода сохранения профиля
            ),
          ],
        ),
        body: Column(
          children: [
            const Divider(), // Разделительная линия под AppBar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage('assets/images/imageMyProfile.jpg'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _fiocontroller,
                    decoration: const InputDecoration(
                      labelText: 'ФИО',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(12)
                    ],
                    controller: _telephoneController,
                    decoration: const InputDecoration(
                      labelText: 'Телефон',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _positionController,
                    decoration: const InputDecoration(
                      labelText: 'Должность',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _teamController,
                    decoration: const InputDecoration(
                      labelText: 'Команда',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () async {
        //       Navigator.of(context).pop('Result 123');
        //     },
        //     child: const Icon(Icons.image)), // Кнопка профиля.
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
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
          currentIndex: _selectedIndex, // Индекс выбранного элемента
          onTap: _onItemTapped, // Метод для обработки нажатий
          selectedItemColor:
              const Color(0xFF48036F), // Фиолетовый цвет для выбранного элемента
          unselectedItemColor:
              Colors.grey, // Серый цвет для невыбранных элементов
        ));
  }
}
