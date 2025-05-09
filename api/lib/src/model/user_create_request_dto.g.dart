// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserCreateRequestDTO extends UserCreateRequestDTO {
  @override
  final String? login;
  @override
  final String? role;
  @override
  final String? lastName;
  @override
  final String? firstName;
  @override
  final String? patronymic;
  @override
  final String? appointment;
  @override
  final Date? birthday;
  @override
  final String? phoneNumber;
  @override
  final String? password;

  factory _$UserCreateRequestDTO(
          [void Function(UserCreateRequestDTOBuilder)? updates]) =>
      (new UserCreateRequestDTOBuilder()..update(updates))._build();

  _$UserCreateRequestDTO._(
      {this.login,
      this.role,
      this.lastName,
      this.firstName,
      this.patronymic,
      this.appointment,
      this.birthday,
      this.phoneNumber,
      this.password})
      : super._();

  @override
  UserCreateRequestDTO rebuild(
          void Function(UserCreateRequestDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserCreateRequestDTOBuilder toBuilder() =>
      new UserCreateRequestDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserCreateRequestDTO &&
        login == other.login &&
        role == other.role &&
        lastName == other.lastName &&
        firstName == other.firstName &&
        patronymic == other.patronymic &&
        appointment == other.appointment &&
        birthday == other.birthday &&
        phoneNumber == other.phoneNumber &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, patronymic.hashCode);
    _$hash = $jc(_$hash, appointment.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserCreateRequestDTO')
          ..add('login', login)
          ..add('role', role)
          ..add('lastName', lastName)
          ..add('firstName', firstName)
          ..add('patronymic', patronymic)
          ..add('appointment', appointment)
          ..add('birthday', birthday)
          ..add('phoneNumber', phoneNumber)
          ..add('password', password))
        .toString();
  }
}

class UserCreateRequestDTOBuilder
    implements Builder<UserCreateRequestDTO, UserCreateRequestDTOBuilder> {
  _$UserCreateRequestDTO? _$v;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _patronymic;
  String? get patronymic => _$this._patronymic;
  set patronymic(String? patronymic) => _$this._patronymic = patronymic;

  String? _appointment;
  String? get appointment => _$this._appointment;
  set appointment(String? appointment) => _$this._appointment = appointment;

  Date? _birthday;
  Date? get birthday => _$this._birthday;
  set birthday(Date? birthday) => _$this._birthday = birthday;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  UserCreateRequestDTOBuilder() {
    UserCreateRequestDTO._defaults(this);
  }

  UserCreateRequestDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _login = $v.login;
      _role = $v.role;
      _lastName = $v.lastName;
      _firstName = $v.firstName;
      _patronymic = $v.patronymic;
      _appointment = $v.appointment;
      _birthday = $v.birthday;
      _phoneNumber = $v.phoneNumber;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserCreateRequestDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserCreateRequestDTO;
  }

  @override
  void update(void Function(UserCreateRequestDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserCreateRequestDTO build() => _build();

  _$UserCreateRequestDTO _build() {
    final _$result = _$v ??
        new _$UserCreateRequestDTO._(
          login: login,
          role: role,
          lastName: lastName,
          firstName: firstName,
          patronymic: patronymic,
          appointment: appointment,
          birthday: birthday,
          phoneNumber: phoneNumber,
          password: password,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
