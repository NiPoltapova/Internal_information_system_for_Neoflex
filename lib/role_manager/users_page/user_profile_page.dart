import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_feed_neoflex/role_manager/users_page/date_format.dart';
import 'package:news_feed_neoflex/role_manager/users_page/phone_format.dart';
import 'package:openapi/openapi.dart';
import 'dart:typed_data';
import 'package:get_it/get_it.dart';

class UserProfilePage extends StatefulWidget {
  final Map<String, String?> userData;
  final File? initialAvatar;
  final Function(UserDTO) onSave; // Изменили тип
  final Function(int) onDelete;
  final Function(File?) onAvatarChanged;

  const UserProfilePage({
    super.key,
    required this.userData,
    this.initialAvatar,
    required this.onSave,
    required this.onDelete,
    required this.onAvatarChanged,
  });

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late TextEditingController _fioController;
  late TextEditingController _phoneController;
  late TextEditingController _positionController;
  late TextEditingController _loginController;
  late TextEditingController _birthDateController;
  String _selectedRole = 'ROLE_USER';
  File? _avatarImage;
  final ImagePicker _picker = ImagePicker();
  bool _obscurePassword = true;
  Color colorForLabel = const Color.fromARGB(255, 104, 102, 102);

  late FocusNode _fioFocus;
  late FocusNode _phoneFocus;
  late FocusNode _loginFocus;

  static const Map<String, String> _roleDisplayNames = {
    'ROLE_USER': 'Сотрудник',
    'ROLE_ADMIN': 'Администратор',
  };

  static const List<String> _availableRoles = ['ROLE_USER', 'ROLE_ADMIN'];

  @override
  void initState() {
    super.initState();
    _fioController = TextEditingController(text: widget.userData['fio']);
    _phoneController =
        TextEditingController(text: widget.userData['phone'] ?? '');
    _positionController =
        TextEditingController(text: widget.userData['position']);
    _loginController =
        TextEditingController(text: widget.userData['login'] ?? '');
    _birthDateController =
        TextEditingController(text: widget.userData['birthDate'] ?? '');
    final roleFromData = widget.userData['role'];
    if (roleFromData != null && _availableRoles.contains(roleFromData)) {
      _selectedRole = roleFromData;
    }
    final avatarUrl = widget.userData['avatarUrl'];
    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      _avatarImage = File(avatarUrl);
    } else {
      _avatarImage = widget.initialAvatar;
    }

    _fioFocus = FocusNode();
    _phoneFocus = FocusNode();
    _loginFocus = FocusNode();
  }

  @override
  void dispose() {
    _fioFocus.dispose();
    _phoneFocus.dispose();
    _loginFocus.dispose();

    _fioController.dispose();
    _phoneController.dispose();
    _positionController.dispose();
    _loginController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    try {
      // Валидация обязательных полей
      if (_fioController.text.isEmpty) {
        throw Exception('ФИО обязательно для заполнения');
      }
      if (_loginController.text.isEmpty) {
        throw Exception('Логин обязателен для заполнения');
      }

      final parts = _fioController.text.trim().split(RegExp(r'\s+'));
      Date? birthday;

      // Обработка даты рождения
      if (_birthDateController.text.isNotEmpty) {
        try {
          final dateTime = DateTime.parse(_birthDateController.text);
          birthday = Date(dateTime.year, dateTime.month, dateTime.day);
        } catch (e) {
          debugPrint('Ошибка парсинга даты: $e');
          throw Exception('Некорректный формат даты рождения');
        }
      }

      final updatedUser = UserDTO((b) => b
        ..id = int.tryParse(widget.userData['id'] ?? '')
        ..firstName = parts.isNotEmpty ? parts[0] : null
        ..lastName = parts.length > 1 ? parts[1] : null
        ..patronymic = parts.length > 2 ? parts[2] : null
        ..phoneNumber =
            _phoneController.text.isNotEmpty ? _phoneController.text : null
        ..appointment = _positionController.text.isNotEmpty
            ? _positionController.text
            : null
        ..role = _selectedRole
        ..login = _loginController.text
        ..birthday = birthday
        ..avatarUrl = widget.userData['avatarUrl']);

      widget.onSave(updatedUser);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Данные пользователя успешно сохранены'),
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ошибка сохранения: ${e.toString()}'),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  Future<void> _pickImage() async {
    try {
      FilePickerResult? result;
      if (Platform.isIOS || Platform.isAndroid) {
        final XFile? image = await _picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 85,
        );
        if (image != null) {
          await _uploadAndUpdateAvatar(File(image.path));
        }
      } else {
        result = await FilePicker.platform.pickFiles(
          type: FileType.image,
          allowMultiple: false,
        );
        if (result != null &&
            result.files.isNotEmpty &&
            result.files.first.path != null) {
          await _uploadAndUpdateAvatar(File(result.files.first.path!));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при выборе изображения: ${e.toString()}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _uploadAndUpdateAvatar(File imageFile) async {
    try {
      // Показываем индикатор загрузки
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Читаем файл в байты
      final bytes = await imageFile.readAsBytes();

      // Создаем запрос для загрузки
      final uploadRequest = UploadAvatarRequest((b) => b..file = bytes);

      // Загружаем аватар на сервер
      final response = await GetIt.I<Openapi>()
          .getUserControllerApi()
          .uploadAvatar(uploadAvatarRequest: uploadRequest);

      // Закрываем индикатор загрузки
      Navigator.of(context).pop();

      if (response.data != null) {
        // Обновляем локальное состояние
        setState(() {
          _avatarImage = imageFile;
        });

        // Обновляем данные пользователя с новым URL аватара
        final updatedUser = UserDTO((b) => b
          ..id = int.tryParse(widget.userData['id'] ?? '')
          ..avatarUrl = response.data);

        // Вызываем callback для сохранения изменений
        widget.onSave(updatedUser);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Аватар успешно обновлен')),
        );
      }
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка загрузки аватара: ${e.toString()}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _confirmDelete() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Подтверждение удаления'),
          content: const Text(
              'Вы уверены, что хотите удалить данные этого пользователя?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Нет'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Да'),
              onPressed: () {
                final userId = int.tryParse(widget.userData['id'] ?? '');
                if (userId != null) {
                  widget.onDelete(userId);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Пользователь удален'),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final avatarUrl = widget.userData['avatarUrl'];
    final fullAvatarUrl = avatarUrl != null && avatarUrl.isNotEmpty
        ? avatarUrl.startsWith('http')
            ? avatarUrl
            : 'http://localhost:8080$avatarUrl' // Используйте ваш базовый URL API
        : null;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            AppBar(
              foregroundColor: Colors.purple,
              title: const Align(
                alignment: Alignment.center,
                child: Text("Профиль пользователя"),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: _saveProfile,
                ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: _avatarImage != null
                          ? ClipOval(
                              child: Image.file(
                                _avatarImage!,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            )
                          : fullAvatarUrl != null
                              ? ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: fullAvatarUrl,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      color: Colors.grey,
                                      child: const Icon(Icons.person,
                                          size: 60, color: Colors.white),
                                    ),
                                    errorWidget: (context, url, error) {
                                      debugPrint(
                                          'Failed to load avatar: $url, error: $error');
                                      return Container(
                                        color: Colors.grey,
                                        child:
                                            const Icon(Icons.error, size: 60),
                                      );
                                    },
                                    httpHeaders: {
                                      'Authorization':
                                          'Bearer YOUR_ACCESS_TOKEN',
                                    },
                                  ),
                                )
                              : const Icon(Icons.camera_alt,
                                  size: 40, color: Colors.white),
                    ),
                    if (_avatarImage != null || fullAvatarUrl != null)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.camera_alt,
                              size: 20, color: Colors.purple),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _fioController,
                focusNode: _fioFocus,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_phoneFocus),
                decoration: InputDecoration(
                  labelText: 'ФИО',
                  labelStyle: TextStyle(
                    color: colorForLabel,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                focusNode: _phoneFocus,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_loginFocus),
                decoration: InputDecoration(
                  labelText: 'Телефон',
                  labelStyle: TextStyle(
                    color: colorForLabel,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: '+7 (___) ___-__-__',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  RuPhoneInputFormatter(),
                  LengthLimitingTextInputFormatter(18)
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _loginController,
                focusNode: _loginFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Логин',
                  labelStyle: TextStyle(
                    color: colorForLabel,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DateInput(
                controller: _birthDateController,
                labelText: 'Дата рождения',
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedRole,
                decoration: InputDecoration(
                  labelText: 'Роль',
                  labelStyle: TextStyle(
                    color: colorForLabel,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: _availableRoles
                    .map((role) => DropdownMenuItem(
                          value: role,
                          child: Text(_roleDisplayNames[role] ?? role),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _positionController,
                decoration: InputDecoration(
                  labelText: 'Должность',
                  labelStyle: TextStyle(
                    color: colorForLabel,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text(
                  'Удалить профиль',
                  style: TextStyle(color: Colors.red),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
                onPressed: _confirmDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
