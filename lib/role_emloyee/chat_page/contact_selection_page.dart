import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class ContactSelectionPage extends StatelessWidget {
  final List<UserDTO> users;

  const ContactSelectionPage({
    super.key,
    required this.users,
  });

//   @override
//   Widget build(BuildContext context) {
//     final contacts = List.generate(20, (index) => 'Контакт ${index + 1}');

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Выберите контакт'),
//       ),
//       body: ListView.builder(
//         itemCount: contacts.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: const CircleAvatar(
//               backgroundImage: AssetImage("assets/images/imageMyProfile.jpg"),
//             ),
//             title: Text(contacts[index]),
//             subtitle: const Text('был(а) недавно'),
//             onTap: () {
//               onContactSelected(contacts[index]);
//               Navigator.pop(context);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите контакт'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  user.avatarUrl != null ? NetworkImage(user.avatarUrl!) : null,
              child: user.avatarUrl == null ? const Icon(Icons.person) : null,
            ),
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Text(user.appointment ?? ''),
            onTap: () {
              Navigator.pop(context, user);
            },
          );
        },
      ),
    );
  }
}
