import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_feed_neoflex/features/auth/auth_repository_impl.dart';
import 'package:openapi/openapi.dart';

class UserProfilePage extends StatefulWidget {
  final Map<String, String?> userData;
  final String? initialAvatarUrl;
  final File? initialAvatarFile;
  final Function(UserDTO) onSave;
  final Function(int) onDelete;
  final Function(File?) onAvatarChanged;

  const UserProfilePage({
    super.key,
    required this.userData,
    this.initialAvatarUrl,
    this.initialAvatarFile,
    required this.onSave,
    required this.onDelete,
    required this.onAvatarChanged,
  });

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _patronymicController;
  late TextEditingController _phoneController;
  late TextEditingController _positionController;
  late TextEditingController _loginController;
  late TextEditingController _birthDateController;
  String _selectedRole = 'ROLE_USER';
  File? _avatarImage;
  String? _avatarUrl;
  bool _isSaving = false;
  Color colorForLabel = const Color.fromARGB(255, 104, 102, 102);

  @override
  void initState() {
    super.initState();
    // Разбираем ФИО из строки 'fio'
    final fioParts = (widget.userData['fio'] ?? '').split(' ');
    _firstNameController =
        TextEditingController(text: fioParts.isNotEmpty ? fioParts[0] : '');
    _lastNameController =
        TextEditingController(text: fioParts.length > 1 ? fioParts[1] : '');
    _patronymicController =
        TextEditingController(text: fioParts.length > 2 ? fioParts[2] : '');

    _phoneController =
        TextEditingController(text: widget.userData['phone'] ?? '');
    _positionController =
        TextEditingController(text: widget.userData['position'] ?? '');
    _loginController =
        TextEditingController(text: widget.userData['login'] ?? '');
    _birthDateController =
        TextEditingController(text: widget.userData['birthDate'] ?? '');

    _selectedRole = widget.userData['role'] ?? 'ROLE_USER';
    _avatarImage = widget.initialAvatarFile;
    _avatarUrl = widget.initialAvatarUrl ?? widget.userData['avatarUrl'];
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _patronymicController.dispose();
    _phoneController.dispose();
    _positionController.dispose();
    _loginController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (_isSaving) return;

    setState(() => _isSaving = true);

    try {
      if (_firstNameController.text.trim().isEmpty ||
          _lastNameController.text.trim().isEmpty) {
        _showSnackBar('Имя и фамилия обязательны', isError: true);
        setState(() => _isSaving = false);
        return;
      }

      if (_loginController.text.trim().isEmpty) {
        _showSnackBar('Логин обязателен', isError: true);
        setState(() => _isSaving = false);
        return;
      }

      Date? birthday;
      if (_birthDateController.text.isNotEmpty) {
        try {
          final dateTime = DateTime.parse(_birthDateController.text);
          birthday = Date(dateTime.year, dateTime.month, dateTime.day);
        } catch (e) {
          throw Exception('Некорректный формат даты');
        }
      }

      // Сначала загружаем аватар, если он есть
      if (_avatarImage != null &&
          _avatarImage?.path != widget.userData['avatarUrl']) {
        await _uploadAvatar(_avatarImage!);
      }

      final updatedUser = UserDTO((b) => b
        ..id = int.tryParse(widget.userData['id'] ?? '')
        ..firstName = _firstNameController.text
        ..lastName = _lastNameController.text
        ..patronymic = _patronymicController.text.isNotEmpty
            ? _patronymicController.text
            : null
        ..phoneNumber =
            _phoneController.text.isNotEmpty ? _phoneController.text : null
        ..appointment = _positionController.text
        ..roleName = _selectedRole
        ..login = _loginController.text
        ..birthday = birthday
        ..avatarUrl = _avatarUrl ?? widget.userData['avatarUrl']);

      await widget.onSave(updatedUser);

      // if (_avatarImage != null &&
      //     _avatarImage?.path != widget.userData['avatarUrl']) {
      //   await _uploadAvatar(_avatarImage!);
      // }

      _showSnackBar('Данные успешно сохранены');
    } catch (e) {
      _showSnackBar('Ошибка сохранения: ${e.toString()}', isError: true);
    } finally {
      setState(() => _isSaving = false);
    }
  }

  Future<void> _uploadAvatar(File imageFile) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
      final bytes = await imageFile.readAsBytes();
      final uploadAvatarRequest = UploadAvatarRequest((b) => b..file = bytes);

      final response = await GetIt.I<Openapi>()
          .getUserControllerApi()
          .uploadAvatar(uploadAvatarRequest: uploadAvatarRequest);

      Navigator.of(context).pop();

      if (response.data != null) {
        setState(() {
          _avatarUrl = response.data;
        });
        widget.onAvatarChanged(imageFile);
        _showSnackBar('Аватар обновлен');
      } else {
        throw Exception('Не удалось загрузить аватар: ответ сервера пуст');
      }
    } catch (e) {
      Navigator.of(context).pop();
      _showSnackBar('Ошибка загрузки аватара: ${e.toString()}', isError: true);
      rethrow;
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _avatarImage = File(pickedFile.path);
          _avatarUrl = null;
        });
      }
    } catch (e) {
      _showSnackBar('Ошибка выбора изображения: ${e.toString()}',
          isError: true);
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  Widget _buildAvatar() {
    final dio = GetIt.I<Dio>();
    final avatarBaseUrl = dio.options.baseUrl;
    final avatarUrl = _avatarUrl ?? widget.userData['avatarUrl'];

    if (_avatarImage != null) {
      return CircleAvatar(
        radius: 50,
        backgroundImage: FileImage(_avatarImage!),
      );
    } else if (avatarUrl != null && avatarUrl.isNotEmpty) {
      final fullUrl = avatarUrl.startsWith('http')
          ? avatarUrl
          : '$avatarBaseUrl${avatarUrl.startsWith('/') ? '' : '/'}$avatarUrl';

      return CachedNetworkImage(
        imageUrl: fullUrl,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: 50,
          backgroundImage: imageProvider,
        ),
        placeholder: (context, url) => CircleAvatar(
          radius: 50,
          child: Icon(Icons.person, size: 50),
        ),
        errorWidget: (context, url, error) => CircleAvatar(
          radius: 50,
          child: Icon(Icons.error, size: 50),
        ),
        httpHeaders: {
          'Authorization':
              'Bearer ${GetIt.I<AuthRepositoryImpl>().getAccessToken()}',
        },
      );
    } else {
      return const CircleAvatar(
        radius: 50,
        child: Icon(Icons.person, size: 50),
      );
    }
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {bool isPhone = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: colorForLabel),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              surfaceTintColor: const Color.fromARGB(255, 100, 29, 113),
              actions: [
                IconButton(
                  icon: _isSaving
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.save),
                  onPressed: _isSaving ? null : _saveProfile,
                ),
              ],
            ),
            const Divider(height: 1, thickness: 1, color: Colors.grey),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: _buildAvatar(),
            ),
            const SizedBox(height: 20),
            _buildTextField(_lastNameController, 'Фамилия'),
            _buildTextField(_firstNameController, 'Имя'),
            _buildTextField(_patronymicController, 'Отчество'),
            _buildTextField(_phoneController, 'Телефон', isPhone: true),
            _buildTextField(_loginController, 'Логин'),
            _buildTextField(_birthDateController, 'Дата рождения'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<String>(
                value: _selectedRole,
                decoration: InputDecoration(
                  labelText: 'Роль',
                  labelStyle: TextStyle(color: colorForLabel),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                      value: 'ROLE_USER', child: Text('Сотрудник')),
                  DropdownMenuItem(
                      value: 'ROLE_ADMIN', child: Text('Администратор')),
                ],
                onChanged: (value) => setState(() => _selectedRole = value!),
              ),
            ),
            _buildTextField(_positionController, 'Должность'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final userId = int.tryParse(widget.userData['id'] ?? '');
                if (userId != null) {
                  widget.onDelete(userId);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Удалить профиль'),
            ),
          ],
        ),
      ),
    );
  }
}
