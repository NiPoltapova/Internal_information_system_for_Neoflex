import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xml/xml.dart' as xml;
import 'dart:ui' as ui;

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<StatefulWidget> createState() => BookPageState();
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

class Workplace {
  final String id;
  bool booked;
  final Rect position;

  Workplace({
    required this.id,
    required this.booked,
    required this.position,
  });
}

class OfficeMap extends StatefulWidget {
  const OfficeMap({super.key});

  @override
  _OfficeMapState createState() => _OfficeMapState();
}

class _OfficeMapState extends State<OfficeMap> {
  int _selectedIndex = 1;
  final String _filter = 'all';
  List<Workplace> workplaces = [];
  late Future<void> _loadingFuture;

  @override
  void initState() {
    super.initState();
    _loadingFuture = _loadWorkplaces();
  }

  Future<void> _loadWorkplaces() async {
    final positions = await _parseSvg();
    final statuses = await _fetchWorkplaceStatuses();
    
    setState(() {
      workplaces = positions.map((pos) => Workplace(
        id: pos.id,
        booked: statuses[pos.id] ?? false,
        position: pos.rect,
      )).toList();
    });
  }

  Future<Map<String, bool>> _fetchWorkplaceStatuses() async {
    // Замените на реальный запрос к API
    return {
      'desk_1': false,
      'desk_2': true,
      'desk_3': false,
      'desk_4': false,
      'desk_5': false,
      'desk_6': false,
    };
  }

  Future<List<WorkplacePosition>> _parseSvg() async {
    final svgString = await DefaultAssetBundle.of(context).loadString('assets/office_map.svg');
    final document = xml.XmlDocument.parse(svgString);
    final workplaces = <WorkplacePosition>[];

    final svg = document.getElement('svg');
    final viewBox = svg!.getAttribute('viewBox')!.split(' ').map(double.parse).toList();
    final svgWidth = viewBox[2];
    final svgHeight = viewBox[3];

    for (var group in document.findAllElements('g')) {
      final id = group.getAttribute('id');
      if (id != null && id.startsWith('desk_')) {
        final rect = group.getElement('rect');
        if (rect != null) {
          final x = double.parse(rect.getAttribute('x')!);
          final y = double.parse(rect.getAttribute('y')!);
          final width = double.parse(rect.getAttribute('width')!);
          final height = double.parse(rect.getAttribute('height')!);
          
          workplaces.add(WorkplacePosition(
            id,
            Rect.fromLTWH(
              x / svgWidth,
              y / svgHeight,
              width / svgWidth,
              height / svgHeight,
            ),
          ));
        }
      }
    }
    return workplaces;
  }

  void _bookPlace(String id) async {
    // Отправка запроса на бронирование
    final success = await _sendBookingRequest(id);
    
    if (success) {
      setState(() {
        workplaces.firstWhere((wp) => wp.id == id).booked = true;
      });
    }
  }

  Future<bool> _sendBookingRequest(String id) async {
    // Реальная реализация API
    return true;
  }

  void _onItemTapped(int index) {
    if (index == 0) Navigator.pushNamed(context, '/');
    if (index == 2) Navigator.pushNamed(context, '/page2');
    if (index == 3) Navigator.pushNamed(context, '/page3');
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _loadingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          
          return InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(20),
            minScale: 0.1,
            maxScale: 4.0,
            child: Stack(
              children: [
                SvgPicture.asset('assets/office_map.svg'),
                ...workplaces.map((wp) => _buildWorkplaceMarker(wp)).toList(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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

  Widget _buildWorkplaceMarker(Workplace wp) {
    final screenSize = MediaQuery.of(context).size;
    
    return Positioned(
      left: wp.position.left * screenSize.width,
      top: wp.position.top * screenSize.height,
      child: GestureDetector(
        onTap: () => _showBookingDialog(wp),
        child: AnimatedMarker(booked: wp.booked),
      ),
    );
  }

  void _showBookingDialog(Workplace wp) {
    if (wp.booked) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Рабочее место ${wp.id.split('_').last}'),
        content: const Text('Забронировать это место?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              _bookPlace(wp.id);
              Navigator.pop(context);
            },
            child: const Text('Забронировать'),
          ),
        ],
      ),
    );
  }
}

class WorkplacePosition {
  final String id;
  final Rect rect;

  WorkplacePosition(this.id, this.rect);
}

class AnimatedMarker extends StatefulWidget {
  final bool booked;

  const AnimatedMarker({super.key, required this.booked});

  @override
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
    )..repeat(reverse: true);
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