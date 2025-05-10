import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_feed_neoflex/role_manager/users_page/date_format.dart';
import 'package:news_feed_neoflex/role_manager/users_page/phone_format.dart';
import 'package:openapi/openapi.dart';

class CreateUserPage extends StatefulWidget {
  final Function(Map<String, String?>) onSave;

  const CreateUserPage({Key? key, required this.onSave}) : super(key: key);

  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _middleNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _positionController;
  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  late TextEditingController _birthDateController;
  late TextEditingController _phoneController;
  String _selectedRole = 'Сотрудник';
  bool _obscurePassword = true;
  Color colorForLabel = const Color.fromARGB(255, 104, 102, 102);

  late FocusNode _lastNameFocus;
  late FocusNode _firstNameFocus;
  late FocusNode _middleNameFocus;
  late FocusNode _phoneFocus;
  late FocusNode _loginFocus;
  late FocusNode _passwordFocus;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _middleNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _positionController = TextEditingController();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _birthDateController = TextEditingController();
    _phoneController = TextEditingController();

    _lastNameFocus = FocusNode();
    _firstNameFocus = FocusNode();
    _middleNameFocus = FocusNode();
    _phoneFocus = FocusNode();
    _loginFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    _lastNameFocus.dispose();
    _firstNameFocus.dispose();
    _middleNameFocus.dispose();
    _phoneFocus.dispose();
    _loginFocus.dispose();
    _passwordFocus.dispose();

    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _positionController.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    _birthDateController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveUser() {
    if (_formKey.currentState!.validate()) {
      try {
        // Преобразуем дату из формата дд.мм.гггг в гггг-мм-дд
        final dateParts = _birthDateController.text.split('.');
        if (dateParts.length != 3) {
          throw FormatException('Неверный формат даты');
        }
        final day = int.parse(dateParts[0]);
        final month = int.parse(dateParts[1]);
        final year = int.parse(dateParts[2]);
        final formattedDate =
            '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

        final newUser = {
          'lastName': _lastNameController.text.trim(),
          'firstName': _firstNameController.text.trim(),
          'patronymic': _middleNameController.text.trim(),
          'phone': _phoneController.text.replaceAll(RegExp(r'[^0-9+]'), ''),
          'position': _positionController.text,
          'role': _selectedRole,
          'login': _loginController.text,
          'password': _passwordController.text,
          'birthDate': formattedDate, // Теперь в правильном формате
        };

        widget.onSave(newUser);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Пользователь успешно создан'),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка формата даты: ${e.toString()}'),
          ),
        );
      }
    }
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
                child: Text("Создание пользователя"),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: _lastNameController,
                  focusNode: _lastNameFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_firstNameFocus);
                  },
                  decoration: InputDecoration(
                    labelText: 'Фамилия',
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
                  validator: (value) => value?.isEmpty ?? true
                      ? 'Пожалуйста, введите фамилию'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _firstNameController,
                  focusNode: _firstNameFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_middleNameFocus);
                  },
                  decoration: InputDecoration(
                    labelText: 'Имя',
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
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Пожалуйста, введите имя' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _middleNameController,
                  focusNode: _middleNameFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_phoneFocus);
                  },
                  decoration: InputDecoration(
                    labelText: 'Отчество',
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
                TextFormField(
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_loginFocus);
                  },
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
                    LengthLimitingTextInputFormatter(18),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _loginController,
                  focusNode: _loginFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
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
                  validator: (value) => value?.isEmpty ?? true
                      ? 'Пожалуйста, введите логин'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: 'Пароль',
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
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.lock_open
                            : Icons.lock_outline),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      )),
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Пожалуйста, введите пароль';
                    }
                    if (value!.length < 6) {
                      return 'Пароль должен содержать минимум 6 символов';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DateInput(
                  controller: _birthDateController,
                  labelText: 'Дата рождения',
                  validator: (value) => value?.isEmpty ?? true
                      ? 'Пожалуйста, введите дату рождения'
                      : null,
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
                  items: ['Сотрудник', 'Администратор']
                      .map((role) => DropdownMenuItem(
                            value: role,
                            child: Text(role),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => _selectedRole = value!),
                ),
                const SizedBox(height: 16),
                TextFormField(
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
                  validator: (value) => value?.isEmpty ?? true
                      ? 'Пожалуйста, введите должность'
                      : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _saveUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Сохранить',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
