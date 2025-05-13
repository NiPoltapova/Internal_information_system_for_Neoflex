// import 'package:flutter/material.dart';

// class AttachedPersonalChatPage extends StatefulWidget {
//   const AttachedPersonalChatPage({super.key, required this.userId});

//   final String userId;

//   @override
//   // ignore: library_private_types_in_public_api
//   _AttachedPersonalChatPageState createState() =>
//       _AttachedPersonalChatPageState();
// }

// class _AttachedPersonalChatPageState extends State<AttachedPersonalChatPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.send, color: Colors.black),
//             onPressed: () {
//               // Share action
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             // Profile Info Section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   const Center(
//                     child: CircleAvatar(
//                       radius: 50,
//                       backgroundImage: NetworkImage(
//                           'https://pplx-res.cloudinary.com/image/upload/v1739344469/user_uploads/aONpvhZRDYjiudA/Snimok-ekrana-2025-02-12-v-10.11.56.jpg'), // Replace with your image URL
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     widget.userId,
//                     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 5),
//                   const Text(
//                     '@id123456',
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 5),
//                   const Text(
//                     'был(а)...',
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),

//             // Action Buttons Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildActionButton(Icons.person_outline, 'Профиль'),
//                   _buildActionButton(Icons.phone, 'Звонок'),
//                   _buildActionButton(Icons.notifications_none, 'Уведомл.'),
//                   _buildActionButton(Icons.search, 'Поиск'),
//                   _buildActionButton(Icons.more_horiz, 'Ещё'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Phone Number
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 children: [
//                   Icon(Icons.phone, color: Colors.green),
//                   SizedBox(width: 10),
//                   Text(
//                     '+7 (xxx) xxx-xx-xx',
//                     style: TextStyle(fontSize: 16, color: Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),

//             // Other Options
//             _buildListTile(Icons.color_lens, 'Оформление чата'),
//             //_buildListTile(Icons.monetization_on, 'Деньги'),

//             // Tabs Section
//             const Expanded(
//               child: DefaultTabController(
//                 length: 5,
//                 child: Column(
//                   children: [
//                     TabBar(
//                       isScrollable: true,
//                       labelColor: Colors.black,
//                       unselectedLabelColor: Colors.grey,
//                       indicatorColor: Colors.green,
//                       tabs: [
//                         Tab(text: 'Фото'),
//                         Tab(text: 'Видео'),
//                         Tab(text: 'Музыка'),
//                         Tab(text: 'Сервисы'),
//                         Tab(text: 'Файлы'),
//                       ],
//                     ),
//                     Expanded(
//                       child: TabBarView(
//                         children: [
//                           // Content for each tab
//                           Center(
//                             child: Text(
//                               'Здесь будут отображаться фотографии из чата',
//                               style:
//                                   TextStyle(fontSize: 16, color: Colors.grey),
//                             ),
//                           ),
//                           Center(child: Text('Видео')),
//                           Center(child: Text('Музыка')),
//                           Center(child: Text('Сервисы')),
//                           Center(child: Text('Файлы')),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildActionButton(IconData icon, String label) {
//     return Column(
//       children: [
//         Icon(icon, color: Colors.green),
//         const SizedBox(height: 5),
//         Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
//       ],
//     );
//   }

//   Widget _buildListTile(IconData icon, String label) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.green),
//       title: Text(label),
//       trailing:
//           const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
//     );
//   }
// }
