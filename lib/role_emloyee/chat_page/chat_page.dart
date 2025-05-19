import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_feed_neoflex/app_routes.dart';
import 'package:news_feed_neoflex/role_manager/users_page/user_profile_page.dart';
import 'package:openapi/openapi.dart';
import 'dart:io';
import 'personal_chat_page.dart';
import 'contact_selection_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchActive = false;
  bool _showCreateOptions = false;
  bool _showGroupCreation = false;
  Map<int, bool> _selectedUsers = {};
  File? _groupImage;
  final TextEditingController _groupNameController = TextEditingController();

  List<ChatSummaryDTO> _chats = [];
  List<UserDTO> _allUsers = [];
  bool _isLoading = true;
  int? _currentUserId;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      // Получаем текущего пользователя
      final currentUserResponse =
          await GetIt.I<Openapi>().getUserControllerApi().getCurrentUser();
      _currentUserId = currentUserResponse.data?.id;

      if (_currentUserId == null) {
        throw Exception('Не удалось получить ID текущего пользователя');
      }

      // Загружаем чаты текущего пользователя
      final chatsResponse =
          await GetIt.I<Openapi>().getChatControllerApi().getMyChats();

      // Загружаем всех пользователей (для создания групп)
      final usersResponse =
          await GetIt.I<Openapi>().getUserControllerApi().getAllUsers();

      setState(() {
        _chats = chatsResponse.data?.content?.toList() ?? [];
        _allUsers = usersResponse.data?.toList() ?? [];
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка загрузки чатов: ${e.toString()}')),
      );
      debugPrint('Ошибка в _loadData: $e');
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _groupNameController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.toLowerCase();
    setState(() => _isSearchActive = query.isNotEmpty);
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _isSearchActive = false;
    });
  }

  Future<void> _pickImage() async {
    // try {
    //   if (kIsWeb ||
    //       Platform.isWindows ||
    //       Platform.isLinux ||
    //       Platform.isMacOS) {
    //     final result =
    //         await FilePicker.platform.pickFiles(type: FileType.image);
    //     if (result != null) {
    //       setState(() => _groupImage = File(result.files.first.path!));
    //     }
    //   } else {
    //     final image =
    //         await ImagePicker().pickImage(source: ImageSource.gallery);
    //     if (image != null) {
    //       setState(() => _groupImage = File(image.path));
    //     }
    //   }
    // } catch (e) {
    //   // ignore: use_build_context_synchronously
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text('Ошибка при выборе изображения')));
    // }
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() => _groupImage = File(image.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ошибка при выборе изображения')),
      );
    }
  }

  void _createGroup() async {
    if (_groupNameController.text.isEmpty ||
        !_selectedUsers.values.any((v) => v)) return;

    try {
      final chatApi = GetIt.I<Openapi>().getChatControllerApi();

      final participantIds = _selectedUsers.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

      final chatDTO = ChatDTO(
        (b) => b
          ..chatType = 'GROUP'
          ..chatName = _groupNameController.text
          ..participantIds = ListBuilder<int>(participantIds),
      );

      final response = await chatApi.createChat(chatDTO: chatDTO);

      if (response.data != null) {
        setState(() {
          _showGroupCreation = false;
          _groupNameController.clear();
          _selectedUsers = {};
          _groupImage = null;
          _chats.insert(0, _convertToSummary(response.data!));
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка создания группы: ${e.toString()}')),
      );
    }
  }

  ChatSummaryDTO _convertToSummary(ChatDTO chat) {
    return ChatSummaryDTO(
      (b) => b
        ..id = chat.id
        ..chatType = chat.chatType
        ..chatName = chat.chatName
        ..lastActivity = chat.createdWhen
        ..lastMessagePreview = 'Новый чат создан',
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.toLowerCase();

    final filteredChats = _isSearchActive
        ? _chats
            .where(
                (chat) => chat.chatName?.toLowerCase().contains(query) ?? false)
            .toList()
        : _chats;

    // final filteredGroups = _isSearchActive
    //     ? _groups
    //         .where((group) => group['name'].toLowerCase().contains(query))
    //         .toList()
    //     : _groups;

    // final displayChats = [
    //   ...filteredGroups
    //       .map((group) => {'name': group['name'], 'isGroup': true, ...group}),
    //   ...filteredUserChats.map((user) => {'name': user, 'isGroup': false}),
    // ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            AppBar(
              foregroundColor: Colors.purple,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: Alignment.centerLeft,
                child: _showGroupCreation
                    ? const Text("Создание группы")
                    : const Text("Чаты"),
              ),
              actions: _showGroupCreation
                  ? null
                  : [
                      IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () =>
                              setState(() => _showCreateOptions = true)),
                    ],
              //scrolledUnderElevation: 0, // Убирает тень при прокрутке
              surfaceTintColor: const Color.fromARGB(255, 100, 29, 113),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 104, 102, 102),
                    ),
                    hintText: 'Поиск',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.purple, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_isSearchActive ? Icons.close : Icons.search),
                      onPressed:
                          _isSearchActive ? _clearSearch : _performSearch,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: filteredChats.length,
                        itemBuilder: (context, index) =>
                            _buildChatTile(filteredChats[index]),
                      ),
              ),
            ],
          ),
          if (_showCreateOptions) _buildCreateOptionsOverlay(),
          if (_showGroupCreation) _buildGroupCreationOverlay(),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.computer),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.message_sharp),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: '',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   selectedItemColor: const Color(0xFF48036F),
      //   unselectedItemColor: Colors.grey,
      // ),
    );
  }

  Widget _buildChatTile(ChatSummaryDTO chat) {
    final isGroup = chat.chatType == 'GROUP';
    final chatName = chat.chatName ?? (isGroup ? 'Группа' : 'Чат');

    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey[200],
        child: isGroup
            ? const Icon(Icons.group, size: 25)
            : const Icon(Icons.person, size: 25),
      ),
      title: Text(chatName),
      subtitle: Text(chat.lastMessagePreview ?? ''),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalChatPage(
              chatId: chat.id!,
              //isGroup: isGroup,
              currentUserId: _currentUserId!),
        ),
      ),
    );
  }

  Widget _buildCreateOptionsOverlay() {
    return Positioned(
      top: 70,
      right: 20,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Создать группу'),
                onTap: () => setState(() {
                  _showCreateOptions = false;
                  _showGroupCreation = true;
                }),
              ),
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('Создать контакт'),
                onTap: () {
                  setState(() => _showCreateOptions = false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactSelectionPage(
                        users: _allUsers,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGroupCreationOverlay() {
    return Positioned.fill(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => setState(() => _showGroupCreation = false),
          ),
          actions: [
            TextButton(
              onPressed: _createGroup,
              child: const Text('Создать'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      _groupImage != null ? FileImage(_groupImage!) : null,
                  child: _groupImage == null
                      ? const Icon(Icons.camera_alt, size: 40)
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _groupNameController,
                  decoration:
                      const InputDecoration(hintText: 'Название группы'),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Участники',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              ..._allUsers.map((user) => CheckboxListTile(
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.appointment ?? ''),
                    value: _selectedUsers[user.id!] ?? false,
                    onChanged: (value) =>
                        setState(() => _selectedUsers[user.id!] = value!),
                    secondary: CircleAvatar(
                      backgroundImage: user.avatarUrl != null
                          ? NetworkImage(user.avatarUrl!)
                          : null,
                      child: user.avatarUrl == null
                          ? const Icon(Icons.person)
                          : null,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

  // Widget _buildGroupChatTile(Map<String, dynamic> group) {
  //   return ListTile(
  //     leading: CircleAvatar(
  //       radius: 25,
  //       backgroundColor: Colors.grey[200],
  //       backgroundImage:
  //           group['image'] != null ? FileImage(group['image']) : null,
  //       child:
  //           group['image'] == null ? const Icon(Icons.group, size: 25) : null,
  //     ),
  //     title: Text(group['name']),
  //     subtitle: Text('Группа: ${group['members'].join(', ')}'),
  //     onTap: () => Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => PersonalChatPage(
  //           userId: group['name'],
  //           isGroup: true,
  //           groupMembers: group['members'],
  //           groupImage: group['image'],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildUserChatTile(String userName) {
  //   return ListTile(
  //     contentPadding: const EdgeInsets.all(16.0),
  //     leading: const CircleAvatar(
  //         backgroundImage: AssetImage("assets/images/imageMyProfile.jpg")),
  //     title: Text(userName),
  //     subtitle: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         const SizedBox(width: 200, height: 50),
  //         Container(
  //           padding: const EdgeInsets.all(8.0),
  //           decoration: BoxDecoration(
  //             color: Colors.red,
  //             borderRadius: BorderRadius.circular(12),
  //           ),
  //           child: const Text('3', style: TextStyle(color: Colors.white)),
  //         ),
  //       ],
  //     ),
  //     onTap: () => Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => PersonalChatPage(userId: userName)),
  //     ),
  //   );
  // }

  // Widget _buildCreateOptionsOverlay() {
  //   return Positioned(
  //     top: 70,
  //     right: 20,
  //     child: Material(
  //       elevation: 4,
  //       borderRadius: BorderRadius.circular(8),
  //       child: Container(
  //         width: 200,
  //         padding: const EdgeInsets.all(8),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //         child: Column(
  //           children: [
  //             ListTile(
  //               leading: const Icon(Icons.group),
  //               title: const Text('Создать группу'),
  //               onTap: () => setState(() {
  //                 _showCreateOptions = false;
  //                 _showGroupCreation = true;
  //               }),
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.person_add),
  //               title: const Text('Создать контакт'),
  //               onTap: () {
  //                 setState(() => _showCreateOptions = false);
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => ContactSelectionPage(
  //                       onContactSelected: (contact) => _addNewChat(contact),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildGroupCreationOverlay() {
  //   return Positioned.fill(
  //     child: Scaffold(
  //       appBar: AppBar(
  //         leading: IconButton(
  //           icon: const Icon(Icons.arrow_back),
  //           onPressed: () => setState(() => _showGroupCreation = false),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: _createGroup,
  //             child: const Text('Создать'),
  //           ),
  //         ],
  //         backgroundColor: Colors.transparent,
  //         elevation: 0,
  //         surfaceTintColor: Colors.transparent,
  //       ),
  //       body: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             const SizedBox(height: 16),
  //             GestureDetector(
  //               onTap: _pickImage,
  //               child: CircleAvatar(
  //                 radius: 50,
  //                 backgroundColor: Colors.grey[200],
  //                 backgroundImage:
  //                     _groupImage != null ? FileImage(_groupImage!) : null,
  //                 child: _groupImage == null
  //                     ? const Icon(Icons.camera_alt, size: 40)
  //                     : null,
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(16.0),
  //               child: TextField(
  //                 controller: _groupNameController,
  //                 decoration:
  //                     const InputDecoration(hintText: 'Название группы'),
  //               ),
  //             ),
  //             const Divider(),
  //             const Padding(
  //               padding: EdgeInsets.all(16.0),
  //               child: Align(
  //                 alignment: Alignment.centerLeft,
  //                 child: Text('Участники',
  //                     style: TextStyle(fontWeight: FontWeight.bold)),
  //               ),
  //             ),
  //             ..._allChats.map((user) => CheckboxListTile(
  //                   title: Text(user),
  //                   subtitle: const Text('был(а) недавно'),
  //                   value: _selectedUsers[user] ?? false,
  //                   onChanged: (value) =>
  //                       setState(() => _selectedUsers[user] = value!),
  //                   secondary: const CircleAvatar(
  //                       backgroundImage:
  //                           AssetImage("assets/images/imageMyProfile.jpg")),
  //                 )),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildBottomNavBar() {
  //   return BottomNavigationBar(
  //     backgroundColor: Colors.white,
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.computer), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.message_sharp), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
  //     ],
  //     currentIndex: _selectedIndex,
  //     onTap: (index) async {
  //       if (index == 0) {
  //         Navigator.pushNamed(context, '/');
  //       } else if (index == 1) {
  //         Navigator.pushNamed(context, '/page1');
  //       } else if (index == 3) {
  //         // Проверка прав администратора
  //         try {
  //           final userApi = GetIt.I<Openapi>().getUserControllerApi();
  //           final response = await userApi.getCurrentUser();

  //           if (response.data != null &&
  //               response.data!.roleName == 'ROLE_ADMIN') {
  //             Navigator.pushNamed(context, AppRoutes.listOfUsers);
  //           } else {
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(
  //                   content: Text('Доступ только для администраторов')),
  //             );
  //           }
  //         } catch (e) {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text('Ошибка проверки прав: ${e.toString()}')),
  //           );
  //         }
  //       } else {
  //         setState(() => _selectedIndex = index);
  //       }
  //     },
  //     selectedItemColor: const Color(0xFF48036F),
  //     unselectedItemColor: Colors.grey,
  //   );
  // }
