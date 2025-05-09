// import 'package:cached_network_image/cached_network_image.dart'; // <-- Добавлен пакет
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get_it/get_it.dart';
// import 'package:openapi/openapi.dart';
// import '../features/auth/auth_repository_impl.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   late TextEditingController _fiocontroller;
//   late TextEditingController _telephoneController;
//   late TextEditingController _positionController;
//   late TextEditingController _teamController;

//   late UserDTO? user;
//   String? _authToken; // <-- Храним токен
//   int _selectedIndex = 3;
//   String _avatarUrl = '';
//   bool _isLoading = true;

//   void _onItemTapped(int index) {
//     if (index == 1) {
//       Navigator.pushNamed(context, '/page1');
//     } else if (index == 2) {
//       Navigator.pushNamed(context, '/page2');
//     } else if (index == 0) {
//       Navigator.pushNamed(context, '/');
//     } else {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fiocontroller = TextEditingController();
//     _telephoneController = TextEditingController();
//     _positionController = TextEditingController();
//     _teamController = TextEditingController();
//     _loadData();
//   }

//     Future<void> _saveProfile() async {
//     try {
//       final userApi = GetIt.I<Openapi>().getUserControllerApi();
//       final int userId = user!.id!;
//       final fioParts = _fiocontroller.text.split(' ');
      
//       final userDTO = UserDTO((b) => b
//         ..id = userId
//         ..lastName = fioParts.isNotEmpty ? fioParts[0] : ''
//         ..firstName = fioParts.length > 1 ? fioParts[1] : ''
//         ..patronymic = fioParts.length > 2 ? fioParts[2] : ''
//         ..appointment = _positionController.text
//         ..login = _telephoneController.text
//       );

//       await userApi.updateCurrentUser(userDTO: userDTO);
      
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Профиль успешно сохранён!')),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Ошибка сохранения профиля')),
//         );
//       }
//     }
//   }

//   Future<void> _loadData() async {
//     try {
//       final authRepo = GetIt.I<AuthRepositoryImpl>();
//       final userApi = GetIt.I<Openapi>().getUserControllerApi();
      
//       // Получаем токен и логин
//       _authToken = await authRepo.getAccessToken(); // <-- Получаем токен
//       final String? userLogin = await authRepo.getCurrentUserName();

//       if (userLogin == null || userLogin.isEmpty) {
//         throw Exception('Логин пользователя не найден');
//       }

//       final response = await userApi.getCurrentUser();
      
//       if (response.statusCode != 200) {
//         throw Exception('Ошибка сервера: ${response.statusCode}');
//       }

//       user = response.data;

//       if (mounted) {
//         setState(() {
//           if (user != null) {
//             _fiocontroller.text = '${user!.lastName} ${user!.firstName} ${user!.patronymic}';
//             _telephoneController.text = user!.login ?? '';
//             _positionController.text = user!.appointment ?? '';
//             _teamController.text = 'Нет';
//             _avatarUrl = user!.avatarUrl != null 
//                 ? 'http://localhost:8080${user!.avatarUrl}'
//                 : '';
//           }
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       if (mounted) {
//         setState(() => _isLoading = false);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Ошибка: ${e.toString()}')),
//         );
//       }
//     }
//   }

//   Widget _buildAvatar() {
//     if (_isLoading) {
//       return const CircularProgressIndicator();
//     }
    
//     return CachedNetworkImage( // <-- Замена CircleAvatar на CachedNetworkImage
//       imageUrl: _avatarUrl,
//       httpHeaders: {
//         if (_authToken != null) 'Authorization': 'Bearer $_authToken' // <-- Добавляем токен
//       },
//       imageBuilder: (context, imageProvider) => CircleAvatar(
//         radius: 80,
//         backgroundImage: imageProvider,
//       ),
//       placeholder: (context, url) => const CircleAvatar(
//         radius: 80,
//         child: CircularProgressIndicator(),
//       ),
//       errorWidget: (context, url, error) => const CircleAvatar(
//         radius: 80,
//         backgroundImage: AssetImage('assets/images/default_avatar.png'),
//       ),
//     );
//   }

//   // Остальной код без изменений
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.purple,
//         title: const Text("Профиль пользователя"),
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: _saveProfile,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const Divider(),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         _buildAvatar(),
//                         const SizedBox(height: 20),
//                         _buildTextField(
//                           controller: _fiocontroller,
//                           label: 'ФИО',
//                           icon: Icons.person,
//                         ),
//                         const SizedBox(height: 15),
//                         _buildPhoneField(),
//                         const SizedBox(height: 15),
//                         _buildTextField(
//                           controller: _positionController,
//                           label: 'Должность',
//                           icon: Icons.work,
//                         ),
//                         const SizedBox(height: 15),
//                         _buildTextField(
//                           controller: _teamController,
//                           label: 'Команда',
//                           icon: Icons.group,
//                           readOnly: true,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.computer),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.message_sharp),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: '',
//             ),
//           ],
//           currentIndex: _selectedIndex, // Индекс выбранного элемента
//           onTap: _onItemTapped, // Метод для обработки нажатий
//           selectedItemColor:
//               Color(0xFF48036F), // Фиолетовый цвет для выбранного элемента
//           unselectedItemColor:
//               Colors.grey, // Серый цвет для невыбранных элементов
//         ));
//   }
// }

// class _PhoneNumberFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     final text = newValue.text.replaceAll(RegExp(r'\D'), '');
//     final newText = StringBuffer();

//     if (text.length >= 1) {
//       newText.write('+7 (${text.substring(1, text.length > 4 ? 4 : text.length)}');
//     }
//     if (text.length > 4) {
//       newText.write(') ${text.substring(4, text.length > 7 ? 7 : text.length)}');
//     }
//     if (text.length > 7) {
//       newText.write('-${text.substring(7, text.length > 9 ? 9 : text.length)}');
//     }

//     return TextEditingValue(
//       text: newText.toString(),
//       selection: TextSelection.collapsed(offset: newText.length),
//     );
//   }

  
// }
