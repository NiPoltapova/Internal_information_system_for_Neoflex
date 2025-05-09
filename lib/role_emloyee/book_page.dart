import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BookPageState();
  }
}

class BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.purple,
        title: const Text('Карта офиса'),
        automaticallyImplyLeading: false,
      ),
      body: const OfficeMap(),
    );
  }
}

class OfficeMap extends StatefulWidget {
  const OfficeMap({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OfficeMapState createState() => _OfficeMapState();
}

class _OfficeMapState extends State<OfficeMap> {
  int _selectedIndex = 1; // Начальный индекс

  List<Map<String, dynamic>> places = [
    {'x': 100, 'y': 200, 'booked': false},
    {'x': 300, 'y': 400, 'booked': false},
    {'x': 500, 'y': 600, 'booked': false},
    // Добавьте больше мест
  ];

  final String _filter = 'all'; // 'all', 'booked', 'free'

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/page2');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/page3',
          arguments: {'title': 'New title2'});
    } else {
      setState(() {
        _selectedIndex = index; // Обновляем индекс при нажатии
      });
    }
  }

  void _bookPlace(int index) {
    setState(() {
      places[index]['booked'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(20),
          minScale: 0.1,
          maxScale: 4.0,
          child: Stack(
            children: [
              Image.asset(
                  'assets/images/office_map.jpg'), // Загрузите изображение карты
              for (var i = 0; i < places.length; i++)
                if (_filter == 'all' ||
                    (_filter == 'booked' && places[i]['booked']) ||
                    (_filter == 'free' && !places[i]['booked']))
                  Positioned(
                    left: places[i]['x'].toDouble(),
                    top: places[i]['y'].toDouble(),
                    child: GestureDetector(
                      onTap: () {
                        if (!places[i]['booked']) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Рабочее место ${i + 1}'),
                                content: const Text('Забронировать это место?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Отмена'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _bookPlace(i);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Забронировать'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: AnimatedMarker(booked: places[i]['booked']),
                    ),
                  ),
            ],
          ),
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

class AnimatedMarker extends StatefulWidget {
  final bool booked;

  const AnimatedMarker({super.key, required this.booked});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedMarkerState createState() => _AnimatedMarkerState();
}

class _AnimatedMarkerState extends State<AnimatedMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Бесконечная анимация
    _animation = Tween(begin: 0.8, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Icon(
        Icons.place,
        color: widget.booked ? Colors.grey : Colors.red,
        size: 40,
      ),
    );
  }
}
