import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'personal_chat_page.dart';
import 'contact_selection_page.dart';

class ChatPage extends StatefulWidget {
  final Map<String, dynamic>? newGroup;
  final String? newContact;

  const ChatPage({super.key, this.newGroup, this.newContact});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  int _selectedIndex = 2;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchActive = false;
  final List<String> _allChats =
      List.generate(10, (index) => 'Имя Пользователя $index');
  bool _showCreateOptions = false;
  bool _showGroupCreation = false;
  Map<String, bool> _selectedUsers = {};
  File? _groupImage;
  final TextEditingController _groupNameController = TextEditingController();
  final List<Map<String, dynamic>> _groups = [];

  @override
  void initState() {
    super.initState();
    _selectedUsers = {for (var user in _allChats) user: false};
    if (widget.newGroup != null) _groups.insert(0, widget.newGroup!);
    if (widget.newContact != null && !_allChats.contains(widget.newContact)) {
      _addNewChat(widget.newContact!);
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

  void _addNewChat(String userName) {
    setState(() {
      _allChats.remove(userName);
      _allChats.insert(0, userName);
      _selectedUsers[userName] = false;
    });
  }

  Future<void> _pickImage() async {
    try {
      if (kIsWeb ||
          Platform.isWindows ||
          Platform.isLinux ||
          Platform.isMacOS) {
        final result =
            await FilePicker.platform.pickFiles(type: FileType.image);
        if (result != null) {
          setState(() => _groupImage = File(result.files.first.path!));
        }
      } else {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          setState(() => _groupImage = File(image.path));
        }
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ошибка при выборе изображения')));
    }
  }

  void _createGroup() {
    if (_groupNameController.text.isEmpty ||
        !_selectedUsers.values.any((v) => v)) {
      return;
    }

    final newGroup = {
      'name': _groupNameController.text,
      'members': _selectedUsers.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList(),
      'image': _groupImage,
      'isGroup': true,
    };

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ChatPage(newGroup: newGroup)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.toLowerCase();

    final filteredUserChats = _isSearchActive
        ? _allChats.where((chat) => chat.toLowerCase().contains(query)).toList()
        : _allChats;

    final filteredGroups = _isSearchActive
        ? _groups
            .where((group) => group['name'].toLowerCase().contains(query))
            .toList()
        : _groups;

    final displayChats = [
      ...filteredGroups
          .map((group) => {'name': group['name'], 'isGroup': true, ...group}),
      ...filteredUserChats.map((user) => {'name': user, 'isGroup': false}),
    ];

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
                child: ListView.builder(
                  itemCount: displayChats.length,
                  itemBuilder: (context, index) => displayChats[index]
                          ['isGroup']
                      ? _buildGroupChatTile(displayChats[index])
                      : _buildUserChatTile(displayChats[index]['name']),
                ),
              ),
            ],
          ),
          if (_showCreateOptions) _buildCreateOptionsOverlay(),
          if (_showGroupCreation) _buildGroupCreationOverlay(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildGroupChatTile(Map<String, dynamic> group) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey[200],
        backgroundImage:
            group['image'] != null ? FileImage(group['image']) : null,
        child:
            group['image'] == null ? const Icon(Icons.group, size: 25) : null,
      ),
      title: Text(group['name']),
      subtitle: Text('Группа: ${group['members'].join(', ')}'),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalChatPage(
            userId: group['name'],
            isGroup: true,
            groupMembers: group['members'],
            groupImage: group['image'],
          ),
        ),
      ),
    );
  }

  Widget _buildUserChatTile(String userName) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16.0),
      leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/images/imageMyProfile.jpg")),
      title: Text(userName),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 200, height: 50),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('3', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PersonalChatPage(userId: userName)),
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
                        onContactSelected: (contact) => _addNewChat(contact),
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
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
              ..._allChats
                  .map((user) => CheckboxListTile(
                        title: Text(user),
                        subtitle: const Text('был(а) недавно'),
                        value: _selectedUsers[user] ?? false,
                        onChanged: (value) =>
                            setState(() => _selectedUsers[user] = value!),
                        secondary: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/imageMyProfile.jpg")),
                      ))
                  ,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.computer), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.message_sharp), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/');
        } else if (index == 1)
          // ignore: curly_braces_in_flow_control_structures
          Navigator.pushNamed(context, '/page1');
        else if (index == 3)
          // ignore: curly_braces_in_flow_control_structures
          Navigator.pushNamed(context, '/page3');
        else
          // ignore: curly_braces_in_flow_control_structures
          setState(() => _selectedIndex = index);
      },
      selectedItemColor: const Color(0xFF48036F),
      unselectedItemColor: Colors.grey,
    );
  }
}
